import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/booking/domain/entity/booked_ticket.dart';
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';
import 'package:mbooking/feature/booking/domain/usecase/reset_booking.dart';
import 'package:mbooking/feature/booking/domain/usecase/select_seats.dart';
import 'package:mbooking/feature/booking/domain/usecase/select_session.dart';
import 'package:mbooking/feature/booking/domain/usecase/start_booking.dart';

part 'booking_state.dart';

// presentation/state/cubit/booking_cubit.dart
class BookingCubit extends Cubit<BookingState> {
  final StartBooking startBooking;
  final SelectSession selectSession;
  final SelectSeats selectSeats;

  final ResetBooking resetBooking;

  BookingCubit({
    required this.startBooking,
    required this.selectSession,
    required this.selectSeats,

    required this.resetBooking,
  }) : super(BookingInitial());

  Future<void> onDetailsContinue({
    required int movieId,
    required String title,
    String? posterPath,
    List<String> genres = const [],
    required String cinemaId,
    required String cinemaName,
    String? cinemaAddress,
  }) async {
    final draft = await startBooking(
      movieId: movieId,
      title: title,
      posterPath: posterPath,
      genres: genres,
      cinemaId: cinemaId,
      cinemaName: cinemaName,
      cinemaAddress: cinemaAddress,
    );
    emit(BookingInProgress(draft));
  }

  Future<void> onReset() async {
    await resetBooking();
    emit(BookingInitial());
  }

  Future<void> onSelectSeats(List<Seat> seats) async {
    try {
      final draft = await selectSeats(seats);
      emit(BookingInProgress(draft));
    } catch (e) {
      emit(BookingFailure(state.draft, message: e.toString()));
    }
  }

  Future<void> onSelectSession({
    required DateTime date,
    required String time,
  }) async {
    final draft = await selectSession(date: date, time: time);
    emit(BookingInProgress(draft));
  }

  void attachOrderId(int orderId) {
    emit(BookingInProgress(state.draft.copyWith(orderId: orderId)));
  }
}
