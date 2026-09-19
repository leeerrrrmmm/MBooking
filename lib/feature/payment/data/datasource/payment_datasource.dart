import 'package:mbooking/feature/payment/data/models/payment_request_method.dart';
import 'package:mbooking/feature/payment/data/models/payment_response_model.dart';

abstract class PaymentDataSource {
  Future<PaymentResponseModel> charge(PaymentRequestModel request);
}
