// feature/ticket/data/models/ticket_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';

class TicketModel extends TicketEntity {
  const TicketModel({
    required super.id,
    required super.orderId,
    required super.movieId,
    required super.title,
    super.posterPath,
    required super.genres,
    required super.cinemaId,
    required super.cinemaName,
    required super.cinemaAddress,
    super.date,
    super.time,
    required super.seatsLabel,
    required super.totalPrice,
    required super.paymentMethod,
    super.transactionId,
    required super.createdAt,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'orderId': orderId,
      'movieId': movieId,
      'title': title,
      'posterPath': posterPath,
      'genres': genres,
      'cinemaId': cinemaId,
      'cinemaName': cinemaName,
      'cinemaAddress': cinemaAddress,
      'date': date != null ? Timestamp.fromDate(date!) : null,
      'time': time,
      'seatsLabel': seatsLabel,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory TicketModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return TicketModel(
      id: doc.id,
      orderId: data['orderId'] as String? ?? '',
      movieId: data['movieId'] as String? ?? '',
      title: data['title'] as String? ?? '',
      posterPath: data['posterPath'] as String?,
      genres: List<String>.from(data['genres'] ?? []),
      cinemaId: data['cinemaId'] as String? ?? '',
      cinemaName: data['cinemaName'] as String? ?? '',
      cinemaAddress: data['cinemaAddress'] as String? ?? '',
      date: (data['date'] as Timestamp?)?.toDate(),
      time: data['time'] as String?,
      seatsLabel: data['seatsLabel'] as String? ?? '',
      totalPrice: (data['totalPrice'] as num?)?.toDouble() ?? 0,
      paymentMethod: data['paymentMethod'] as String? ?? '',
      transactionId: data['transactionId'] as String?,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
