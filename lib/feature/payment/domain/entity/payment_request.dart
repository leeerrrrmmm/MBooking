import 'package:mbooking/feature/payment/domain/entity/payment_method.dart';

class PaymentRequest {
  final double amount; // USD, итоговая сумма
  final PaymentMethodType method;
  final String? orderId; // можно передать свой, или сгенерит шлюз

  const PaymentRequest({
    required this.amount,
    required this.method,
    this.orderId,
  });
}
