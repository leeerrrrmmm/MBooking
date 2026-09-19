// payment_state.dart
part of 'payment_cubit.dart';

sealed class PaymentState {
  const PaymentState();
}

class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

class PaymentProcessing extends PaymentState {
  const PaymentProcessing();
}

class PaymentSuccess extends PaymentState {
  final TicketEntity ticket;
  const PaymentSuccess(this.ticket);
}

class PaymentFailure extends PaymentState {
  final String message;
  const PaymentFailure(this.message);
}
