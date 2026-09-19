import 'package:mbooking/feature/payment/domain/entity/payment_method.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';

class BookingDraft {
  final int? orderId;
  final int? movieId;
  final String? title;
  final String? posterPath;
  final List<String> genres;

  final String? cinemaId;
  final String? cinemaName;
  final String? cinemaAddress;

  // ===== то, что заполняет SelectSeatsScreen =====
  final DateTime? date; // выбранная дата
  final String? time; // выбранное время ("14:30")
  final List<Seat> seats; // выбранные места (с ценой в $)

  final PaymentMethodType? paymentMethod;

  const BookingDraft({
    this.orderId,
    this.movieId,
    this.title,
    this.posterPath,
    this.genres = const [],
    this.cinemaId,
    this.cinemaName,
    this.cinemaAddress,
    this.date,
    this.time,
    this.seats = const [],
    this.paymentMethod,
  });

  // ----- helpers -----
  bool get hasMovie => movieId != null && title != null;
  bool get hasPaymentMethod => paymentMethod != null;
  bool get hasSeats => seats.isNotEmpty;
  bool get hasSession => date != null && time != null;

  bool get isReadyForPayment =>
      hasMovie && hasSession && hasSeats && hasPaymentMethod;

  /// Удобная строка мест: "A3, B5, C2"
  String get seatsLabel => seats.map((s) => s.id).join(', ');

  /// Общая цена билетов в долларах
  double get totalPrice => seats.fold(0.0, (sum, s) => sum + s.price);

  BookingDraft copyWith({
    int? orderId,
    int? movieId,
    String? title,
    String? posterPath,
    List<String>? genres,
    String? cinemaId,
    String? cinemaName,
    String? cinemaAddress,
    DateTime? date,
    String? time,
    List<Seat>? seats,
    PaymentMethodType? paymentMethod,
  }) {
    return BookingDraft(
      orderId: orderId ?? this.orderId,
      movieId: movieId ?? this.movieId,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      cinemaId: cinemaId ?? this.cinemaId,
      cinemaName: cinemaName ?? this.cinemaName,
      cinemaAddress: cinemaAddress ?? this.cinemaAddress,
      date: date ?? this.date,
      time: time ?? this.time,
      seats: seats ?? this.seats,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
