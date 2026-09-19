// feature/ticket/data/datasources/ticket_remote_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mbooking/core/error/app_exception.dart';
import 'package:mbooking/feature/ticket/data/model/ticket_model.dart';

abstract class TicketRemoteDataSource {
  Future<TicketModel> saveTicket(TicketModel ticket);
  Future<List<TicketModel>> getUserTickets();
  Future<TicketModel> getTicketById(String ticketId);
}

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  TicketRemoteDataSourceImpl({required this.firestore, required this.auth});

  String get _uid {
    final user = auth.currentUser;
    if (user == null) throw AuthException('User not authenticated');
    return user.uid;
  }

  CollectionReference get _ticketsRef =>
      firestore.collection('users').doc(_uid).collection('tickets');

  @override
  Future<TicketModel> saveTicket(TicketModel ticket) async {
    try {
      // id = orderId (или doc().id — как удобнее)
      final docRef = _ticketsRef.doc(ticket.orderId);
      await docRef.set(ticket.toFirestore());
      return ticket;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Failed to save ticket');
    }
  }

  @override
  Future<List<TicketModel>> getUserTickets() async {
    try {
      final snap = await _ticketsRef
          .orderBy('createdAt', descending: true)
          .get();
      return snap.docs.map(TicketModel.fromFirestore).toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Failed to load tickets');
    }
  }

  @override
  Future<TicketModel> getTicketById(String ticketId) async {
    try {
      final doc = await _ticketsRef.doc(ticketId).get();
      return TicketModel.fromFirestore(doc);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Failed to load ticket');
    }
  }
}
