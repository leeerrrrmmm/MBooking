import 'package:mbooking/feature/payment/domain/entity/payment_method.dart';

class PaymentResult {
  final String transactionId;
  final double amountPaid;
  final DateTime paidAt;
  final PaymentMethodType method;

  const PaymentResult({
    required this.transactionId,
    required this.amountPaid,
    required this.paidAt,
    required this.method,
  });
}
