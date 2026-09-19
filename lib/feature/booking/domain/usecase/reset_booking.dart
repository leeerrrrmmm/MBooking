import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';

class ResetBooking {
  final BookingRepository repository;
  ResetBooking(this.repository);

  Future<void> call() => repository.clearDraft();
}
