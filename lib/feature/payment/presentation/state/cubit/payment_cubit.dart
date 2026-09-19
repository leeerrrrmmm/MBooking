// payment_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/payment/domain/usecase/complete_payment.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CompletePayment completePayment;

  PaymentCubit(this.completePayment) : super(const PaymentInitial());

  Future<void> pay({
    required BookingDraft draft,
    required double amount,
  }) async {
    emit(const PaymentProcessing());

    final result = await completePayment(draft: draft, amount: amount);

    result.fold(
      (failure) => emit(PaymentFailure(failure.message)),
      (ticket) => emit(PaymentSuccess(ticket)),
    );
  }

  void reset() => emit(const PaymentInitial());
}
