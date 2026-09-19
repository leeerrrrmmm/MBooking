import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';

class BookedTicket {
  final String id;
  final BookingDraft draft;
  final DateTime purchasedAt;
  final String status; // confirmed / used / cancelled

  const BookedTicket({
    required this.id,
    required this.draft,
    required this.purchasedAt,
    this.status = 'confirmed',
  });
}

