import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_result.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';

class CreateTicketFromBookingUseCase {
  TicketEntity call({
    required BookingDraft draft,
    required PaymentResult result,
  }) {
    return TicketEntity(
      id: draft.orderId.toString(),
      orderId: draft.orderId.toString(),
      movieId: draft.movieId?.toString() ?? '',
      title: draft.title ?? '',
      posterPath: draft.posterPath,
      genres: List<String>.from(draft.genres),
      cinemaId: draft.cinemaId ?? '',
      cinemaName: draft.cinemaName ?? '',
      cinemaAddress: draft.cinemaAddress ?? '',
      date: draft.date,
      time: draft.time,
      seatsLabel: draft.seatsLabel,
      totalPrice: draft.totalPrice,
      paymentMethod: result.method.name,
      transactionId: result.transactionId,
      createdAt: DateTime.now(),
    );
  }
}
