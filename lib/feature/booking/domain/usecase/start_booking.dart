// domain/usecase/start_booking.dart
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';

class StartBooking {
  final BookingRepository repository;
  StartBooking(this.repository);

  Future<BookingDraft> call({
    required int movieId,
    required String title,
    String? posterPath,
    List<String> genres = const [],
    required String cinemaId,
    required String cinemaName,
    String? cinemaAddress,
  }) async {
    final draft = BookingDraft(
      movieId: movieId,
      title: title,
      posterPath: posterPath,
      genres: genres,
      cinemaId: cinemaId,
      cinemaName: cinemaName,
      cinemaAddress: cinemaAddress,
    );
    await repository.saveDraft(draft);
    return draft;
  }
}
