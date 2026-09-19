// feature/payment/data/datasource/stripe_payment_datasource.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentMethodType;
import 'package:mbooking/feature/payment/data/datasource/payment_datasource.dart';
import 'package:mbooking/feature/payment/data/models/payment_request_method.dart';
import 'package:mbooking/feature/payment/data/models/payment_response_model.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_method.dart';

/// Test-mode Stripe only. Live keys are rejected at startup and on every charge.
/// Secret key stays on the device on purpose for this pet project.
class StripePaymentDataSource implements PaymentDataSource {
  static const _merchantName = 'MBooking';
  static const _currency = 'usd';
  static const _countryCode = 'US';

  final String _secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';

  void _ensureTestMode() {
    final publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
    if (!_secretKey.startsWith('sk_test_') ||
        !publishableKey.startsWith('pk_test_')) {
      throw Exception(
        'Stripe test keys required. Live keys are not allowed in this app.',
      );
    }
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.stripe.com/v1',
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  @override
  Future<PaymentResponseModel> charge(PaymentRequestModel request) async {
    _ensureTestMode();
    if (request.amount <= 0) {
      throw Exception('Invalid amount');
    }

    final method = PaymentMethodType.values.byName(request.paymentMethod);
    final clientSecret = await _createPaymentIntent(request.amount);
    final paymentIntentId = clientSecret.split('_secret_').first;

    try {
      switch (method) {
        case PaymentMethodType.card:
          await _presentCardSheet(clientSecret);
        case PaymentMethodType.googlePay:
          await _presentGooglePay(clientSecret);
        case PaymentMethodType.applePay:
          await _presentApplePay(clientSecret, request.amount);
        case PaymentMethodType.cash:
          throw Exception('Cash checkout is not available');
      }
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        throw Exception('Payment cancelled');
      }
      throw Exception(
        e.error.localizedMessage ?? 'Payment failed. Please try again.',
      );
    }

    return PaymentResponseModel(
      ticketId: paymentIntentId,
      status: 'confirmed',
      purchasedAt: DateTime.now().toIso8601String(),
    );
  }

  Future<String> _createPaymentIntent(double amount) async {
    try {
      final response = await _dio.post(
        '/payment_intents',
        options: Options(headers: {'Authorization': 'Bearer $_secretKey'}),
        data: {
          'amount': (amount * 100).round().toString(),
          'currency': _currency,
          'payment_method_types[]': 'card',
          'capture_method': 'automatic',
          'payment_method_options[card][request_three_d_secure]': 'automatic',
          'metadata[environment]': 'test',
          'description': 'MBooking test payment',
        },
      );
      final clientSecret = response.data['client_secret'] as String?;
      if (clientSecret == null || clientSecret.isEmpty) {
        throw Exception('Stripe did not return a client secret');
      }
      return clientSecret;
    } on DioException catch (e) {
      final message = e.response?.data?['error']?['message'] ?? e.message;
      throw Exception('Stripe error: $message');
    }
  }

  Future<void> _presentCardSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: _merchantName,
        style: ThemeMode.dark,
        paymentMethodOrder: const ['card'],
        linkDisplayParams: const LinkDisplayParams(
          linkDisplay: LinkDisplay.never,
        ),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: _countryCode,
          currencyCode: 'USD',
          testEnv: true,
          label: _merchantName,
        ),
        billingDetailsCollectionConfiguration:
            const BillingDetailsCollectionConfiguration(
              name: CollectionMode.automatic,
              email: CollectionMode.automatic,
            ),
      ),
    );
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> _presentGooglePay(String clientSecret) async {
    if (!Platform.isAndroid) {
      throw Exception('Google Pay is only available on Android');
    }

    final supported = await Stripe.instance.isPlatformPaySupported(
      googlePay: const IsGooglePaySupportedParams(testEnv: true),
    );
    if (!supported) {
      throw Exception(
        'Google Pay is not available on this device. Use a card instead.',
      );
    }

    await Stripe.instance.confirmPlatformPayPaymentIntent(
      clientSecret: clientSecret,
      confirmParams: const PlatformPayConfirmParams.googlePay(
        googlePay: GooglePayParams(
          testEnv: true,
          merchantCountryCode: _countryCode,
          currencyCode: 'USD',
          merchantName: _merchantName,
        ),
      ),
    );
  }

  Future<void> _presentApplePay(String clientSecret, double amount) async {
    if (!Platform.isIOS) {
      throw Exception('Apple Pay is only available on iOS');
    }

    final supported = await Stripe.instance.isPlatformPaySupported();
    if (!supported) {
      throw Exception(
        'Apple Pay is not available on this device. Use a card instead.',
      );
    }

    await Stripe.instance.confirmPlatformPayPaymentIntent(
      clientSecret: clientSecret,
      confirmParams: PlatformPayConfirmParams.applePay(
        applePay: ApplePayParams(
          merchantCountryCode: _countryCode,
          currencyCode: 'USD',
          cartItems: [
            ApplePayCartSummaryItem.immediate(
              label: _merchantName,
              amount: amount.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}
