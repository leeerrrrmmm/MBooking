import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';

import '../entity/payment_request.dart';
import '../entity/payment_result.dart';

abstract class PaymentRepository {
  Future<PaymentResult> charge(PaymentRequest request);

  Future<PaymentResult> chargeFromDraft({
    required BookingDraft draft,
    required double amount,
  });
}
