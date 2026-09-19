// data/model/payment_response_model.dart
class PaymentResponseModel {
  final String ticketId;
  final String status;
  final String purchasedAt;

  const PaymentResponseModel({
    required this.ticketId,
    required this.status,
    required this.purchasedAt,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      ticketId: json['ticket_id'] as String,
      status: json['status'] as String? ?? 'confirmed',
      purchasedAt: json['purchased_at'] as String,
    );
  }
}
