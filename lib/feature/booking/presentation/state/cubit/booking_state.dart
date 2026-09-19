part of 'booking_cubit.dart';

class BookingFailure extends BookingState {
  final String message;
  const BookingFailure(super.draft, {required this.message});
}

class BookingInitial extends BookingState {
  const BookingInitial() : super(const BookingDraft());
}

class BookingInProgress extends BookingState {
  const BookingInProgress(super.draft);
}

class BookingPaymentInProgress extends BookingState {
  const BookingPaymentInProgress(super.draft);
}

class BookingPaymentSuccess extends BookingState {
  final BookedTicket ticket;
  const BookingPaymentSuccess(super.draft, {required this.ticket});
}

sealed class BookingState {
  final BookingDraft draft;
  const BookingState(this.draft);
}
