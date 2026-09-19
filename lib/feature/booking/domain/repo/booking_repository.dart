// domain/repository/booking_repository.dart
import 'package:mbooking/feature/booking/domain/entity/booked_ticket.dart';
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';

abstract class BookingRepository {
  Future<void> clearDraft();

  /// Удалённая оплата
  Future<BookedTicket> confirmPayment(BookingDraft draft);

  /// Локальный draft (in-memory / secure storage)
  BookingDraft getDraft();

  /// Опционально: карта мест
  Future<List<Seat>> getSeats({
    required int movieId,
    required String cinemaId,
    required DateTime date,
    required String time,
  });

  Future<void> saveDraft(BookingDraft draft);
}
