// feature/booking/domain/entity/seat.dart
enum SeatStatus { available, reserved, selected }

class Seat {
  final String id; // например "A1", "B5"
  final String row; // "A", "B"...
  final int number; // 1, 2, 3...
  final double price;
  final SeatStatus status;

  const Seat({
    required this.id,
    required this.row,
    required this.number,
    required this.price,
    this.status = SeatStatus.available,
  });

  Seat copyWith({SeatStatus? status}) {
    return Seat(
      id: id,
      row: row,
      number: number,
      price: price,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Seat && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
