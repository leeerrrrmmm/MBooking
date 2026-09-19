import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';

class PaymentRequestModel {
  final int movieId;
  final String cinemaId;
  final String date; // ISO
  final String time;
  final List<String> seatIds;
  final String paymentMethod;
  final double amount;

  const PaymentRequestModel({
    required this.movieId,
    required this.cinemaId,
    required this.date,
    required this.time,
    required this.seatIds,
    required this.paymentMethod,
    required this.amount,
  });

  factory PaymentRequestModel.fromDraft(BookingDraft draft) {
    return PaymentRequestModel(
      movieId: draft.movieId!,
      cinemaId: draft.cinemaId!,
      date: draft.date!.toIso8601String(),
      time: draft.time!,
      seatIds: draft.seats.map((s) => s.id).toList(),
      paymentMethod: draft.paymentMethod!.name,
      amount: draft.totalPrice,
    );
  }

  Map<String, dynamic> toJson() => {
    'movie_id': movieId,
    'cinema_id': cinemaId,
    'date': date,
    'time': time,
    'seats': seatIds,
    'payment_method': paymentMethod,
    'amount': amount,
  };
}
