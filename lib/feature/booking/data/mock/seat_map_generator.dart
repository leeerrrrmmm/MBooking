// feature/booking/data/mock/seat_map_generator.dart
import 'package:mbooking/feature/booking/domain/entity/seat.dart';

class SeatMapGenerator {
  /// Генерирует карту мест для конкретной даты.
  /// Разные дни → разные зарезервированные места (захардкожено).
  static List<Seat> generateForDate(DateTime date) {
    final day = date.day;
    final month = date.month;

    // Базовая сетка: 8 рядов (A–H), по 10 мест
    final rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    final List<Seat> seats = [];

    for (final row in rows) {
      for (int num = 1; num <= 10; num++) {
        final id = '$row$num';
        final price = _priceForRow(row);

        // Захардкоженные reserved в зависимости от дня
        final isReserved = _isReserved(day, month, row, num);

        seats.add(
          Seat(
            id: id,
            row: row,
            number: num,
            price: price,
            status: isReserved ? SeatStatus.reserved : SeatStatus.available,
          ),
        );
      }
    }

    return seats;
  }

  static double _priceForRow(String row) {
    // VIP-ряды дороже
    if (row == 'A' || row == 'B') return 450;
    if (row == 'C' || row == 'D') return 350;
    return 250;
  }

  /// Захардкоженная логика reserved мест по дню.
  /// Можно менять как угодно — это просто демо.
  static bool _isReserved(int day, int month, String row, int num) {
    // Пример 1: чётные дни — середина зала зарезервирована
    if (day % 2 == 0) {
      if (['C', 'D', 'E'].contains(row) && num >= 4 && num <= 7) {
        return true;
      }
    }

    // Пример 2: нечётные дни — края
    if (day % 2 == 1) {
      if (num == 1 || num == 10) return true;
      if (row == 'A' && num % 2 == 0) return true;
    }

    // Пример 3: 15-е число — почти всё занято в VIP
    if (day == 15) {
      if (['A', 'B'].contains(row)) return true;
    }

    // Пример 4: выходные (суббота/воскресенье) — больше reserved
    // (если нужно, можно передавать weekday)

    // Фиксированные "вечные" reserved (например техническое место)
    if (row == 'H' && num == 5) return true;

    return false;
  }
}
