// feature/payment/data/repo/payment_repository_impl.dart
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/payment/data/datasource/payment_datasource.dart';
import 'package:mbooking/feature/payment/data/models/payment_request_method.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_request.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_result.dart';
import 'package:mbooking/feature/payment/domain/repo/payment_repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<PaymentResult> charge(PaymentRequest request) async {
    final model = PaymentRequestModel(
      movieId: 0,
      cinemaId: '',
      date: DateTime.now().toIso8601String(),
      time: '',
      seatIds: const [],
      paymentMethod: request.method.name,
      amount: request.amount,
    );

    final response = await dataSource.charge(model);

    return PaymentResult(
      transactionId: response.ticketId,
      amountPaid: request.amount,
      paidAt: DateTime.tryParse(response.purchasedAt) ?? DateTime.now(),
      method: request.method,
    );
  }

  @override
  Future<PaymentResult> chargeFromDraft({
    required BookingDraft draft,
    required double amount,
  }) async {
    final method = draft.paymentMethod;
    if (method == null) {
      throw StateError('Payment method not selected');
    }
    if (draft.movieId == null || draft.cinemaId == null) {
      throw StateError('Booking incomplete');
    }

    final model = PaymentRequestModel(
      movieId: draft.movieId!,
      cinemaId: draft.cinemaId!,
      date: draft.date!.toIso8601String(),
      time: draft.time!,
      seatIds: draft.seats.map((s) => s.id).toList(),
      paymentMethod: method.name,
      amount: amount, // сумма с кнопки (со скидкой)
    );

    final response = await dataSource.charge(model);

    return PaymentResult(
      transactionId: response.ticketId,
      amountPaid: amount,
      paidAt: DateTime.tryParse(response.purchasedAt) ?? DateTime.now(),
      method: method,
    );
  }
}
