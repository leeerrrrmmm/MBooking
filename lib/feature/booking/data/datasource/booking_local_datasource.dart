// data/datasource/booking_local_datasource.dart
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';

abstract class BookingLocalDataSource {
  Future<void> clearDraft();
  BookingDraft? getDraft();
  Future<void> saveDraft(BookingDraft draft);
}

class BookingLocalDataSourceImpl implements BookingLocalDataSource {
  BookingDraft? _draft;

  @override
  Future<void> clearDraft() async {
    _draft = null;
  }

  @override
  BookingDraft? getDraft() => _draft;

  @override
  Future<void> saveDraft(BookingDraft draft) async {
    _draft = draft;
  }
}
