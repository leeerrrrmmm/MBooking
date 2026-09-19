// data/repository/booking_repository_impl.dart
import 'package:mbooking/feature/booking/data/datasource/booking_local_datasource.dart';
import 'package:mbooking/feature/booking/data/datasource/booking_remote_datasource.dart';
import 'package:mbooking/feature/payment/data/models/payment_request_method.dart';
import 'package:mbooking/feature/booking/domain/entity/booked_ticket.dart';
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';
import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remote;
  final BookingLocalDataSource local;

  BookingRepositoryImpl({required this.remote, required this.local});

  @override
  Future<void> clearDraft() => local.clearDraft();

  @override
  Future<BookedTicket> confirmPayment(BookingDraft draft) async {
    final request = PaymentRequestModel.fromDraft(draft);
    final response = await remote.pay(request);

    return BookedTicket(
      id: response.ticketId,
      draft: draft,
      purchasedAt: DateTime.tryParse(response.purchasedAt) ?? DateTime.now(),
      status: response.status,
    );
  }

  @override
  BookingDraft getDraft() {
    return local.getDraft() ?? const BookingDraft();
  }

  @override
  Future<List<Seat>> getSeats({
    required int movieId,
    required String cinemaId,
    required DateTime date,
    required String time,
  }) async {
    final raw = await remote.fetchSeats(
      movieId: movieId,
      cinemaId: cinemaId,
      date: date.toIso8601String(),
      time: time,
    );
    // map json → Seat
    return raw
        .map(
          (e) => Seat(
            id: e['id'] as String,
            row: e['row'] as String,
            number: e['number'] as int,
            price: (e['price'] as num).toDouble(),
            status: e['status'] as SeatStatus? ?? SeatStatus.available,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveDraft(BookingDraft draft) => local.saveDraft(draft);
}
