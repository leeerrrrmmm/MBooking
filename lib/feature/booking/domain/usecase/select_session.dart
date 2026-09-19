import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';

class SelectSession {
  final BookingRepository repository;
  SelectSession(this.repository);

  Future<BookingDraft> call({
    required DateTime date,
    required String time,
  }) async {
    final current = repository.getDraft();
    final updated = current.copyWith(date: date, time: time);
    await repository.saveDraft(updated);
    return updated;
  }
}
