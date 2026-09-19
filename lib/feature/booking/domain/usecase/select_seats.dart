import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';
import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';

class SelectSeats {
  final BookingRepository repository;
  SelectSeats(this.repository);

  Future<BookingDraft> call(List<Seat> seats) async {
    if (seats.isEmpty) {
      throw ArgumentError('Select at least one seat');
    }
    final current = repository.getDraft();
    final updated = current.copyWith(seats: seats);
    await repository.saveDraft(updated);
    return updated;
  }
}
