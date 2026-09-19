// domain/entities/ticket_entity.dart
import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final String id;
  final String orderId;
  final String movieId;
  final String title;
  final String? posterPath;
  final List<String> genres;
  final String cinemaId;
  final String cinemaName;
  final String cinemaAddress;
  final DateTime? date;
  final String? time;
  final String seatsLabel;
  final double totalPrice;
  final String paymentMethod;
  final String? transactionId;
  final DateTime createdAt;

  const TicketEntity({
    required this.id,
    required this.orderId,
    required this.movieId,
    required this.title,
    this.posterPath,
    required this.genres,
    required this.cinemaId,
    required this.cinemaName,
    required this.cinemaAddress,
    this.date,
    this.time,
    required this.seatsLabel,
    required this.totalPrice,
    required this.paymentMethod,
    this.transactionId,
    required this.createdAt,
  });

  String get qrPayload =>
      '''
Order ID: $orderId
Payment: $paymentMethod
Amount: $totalPrice\$
Seats: $seatsLabel
Movie: $title
Date: ${date?.toLocal().toString().split(' ').first ?? ''}
Time: ${time ?? ''}
''';

  @override
  List<Object?> get props => [id, orderId];
}
