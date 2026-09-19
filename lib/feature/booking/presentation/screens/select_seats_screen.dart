import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/core/const/consts.dart';
import 'package:mbooking/feature/booking/domain/entity/seat.dart';
import 'package:mbooking/feature/booking/presentation/state/cubit/booking_cubit.dart';
import 'package:mbooking/feature/booking/presentation/widgets/check_box_row_widget.dart';
import 'package:mbooking/router/app_routes.dart';

class SelectSeatsScreen extends StatefulWidget {
  const SelectSeatsScreen({super.key});

  @override
  State<SelectSeatsScreen> createState() => _SelectSeatsScreenState();
}

class _SelectSeatsScreenState extends State<SelectSeatsScreen> {
  // ========== ЦЕНЫ В ДОЛЛАРАХ ==========
  static const double _basePrice = 12.0; // обычные ряды
  static const double _vipPrice = 18.0; // первые 2 ряда
  bool _showSelected = false;

  bool _showReserved = false;

  bool _showAvailable = false;

  // Выбранные места (по id: "A2", "B5" ...)
  final Set<String> _selectedSeatIds = {};
  // Карта статусов мест для текущей даты (id → isReserved)
  late Map<String, bool> _reservedMap;
  late final List<DateTime> _dates;
  late DateTime _selectedDate;

  late List<String> _timesForSelectedDate;
  String? _selectedTime;

  double get _totalPrice {
    return _selectedSeatIds.fold(0.0, (sum, id) {
      final row = id[0];
      return sum + _priceForSeat(row);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Seats',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 4,
              width: double.infinity,
              color: Colors.amber,
            ),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Column(
                children: [
                  // ========== СЕТКА МЕСТ ==========
                  ...List.generate(Consts.rowLabels.length, (rowIndex) {
                    final rowLabel = Consts.rowLabels[rowIndex];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(Consts.seatsRow, (seatIndex) {
                          final seatNumber = seatIndex + 2;
                          final seatCode = '$rowLabel$seatNumber';
                          final isReserved = _reservedMap[seatCode] ?? false;

                          return GestureDetector(
                            onTap: () => _onSeatTap(seatCode),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _seatColor(seatCode),
                                borderRadius: BorderRadius.circular(6),
                                // лёгкая обводка для reserved, чтобы было видно даже если цвет похож
                                border: isReserved && _showReserved
                                    ? Border.all(
                                        color: const Color(0xFF9E9E9E),
                                        width: 1,
                                      )
                                    : null,
                              ),
                              child: Text(
                                seatCode,
                                style: TextStyle(
                                  color: _textColor(seatCode),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                  const SizedBox(height: 24),

                  // ========== ЧЕКБОКСЫ ==========
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBoxRowWidget(
                          label: 'Available',
                          onChanged: () {
                            setState(() => _showAvailable = !_showAvailable);
                          },
                          value: _showAvailable,
                        ),
                        CheckBoxRowWidget(
                          label: 'Reserved',
                          onChanged: () {
                            setState(() => _showReserved = !_showReserved);
                          },
                          value: _showReserved,
                        ),
                        CheckBoxRowWidget(
                          label: 'Selected',
                          onChanged: () {
                            setState(() => _showSelected = !_showSelected);
                          },
                          value: _showSelected,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ========== DATE & TIME ==========
                  const Text(
                    'Select Date & Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Горизонтальный список дат
                  SizedBox(
                    height: 104,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _dates.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final date = _dates[index];
                        final isSelected =
                            date.year == _selectedDate.year &&
                            date.month == _selectedDate.month &&
                            date.day == _selectedDate.day;

                        return GestureDetector(
                          onTap: () => _onDateSelected(date),
                          child: Container(
                            width: 52,
                            height: 104,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFCC434)
                                  : const Color(0xFF1C1C1C),
                              borderRadius: BorderRadius.circular(24),
                              border: isSelected
                                  ? null
                                  : Border.all(
                                      color: const Color(0xFF3A3A3A),
                                      width: 1,
                                    ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _monthAbbr(date.month),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.black
                                        : const Color(0xFFBFBFBF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected
                                        ? const Color(0xFF1D1D1D)
                                        : const Color(0xFF2A2A2A),
                                  ),
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      color: isSelected
                                          ? const Color(0xFFFCC434)
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Горизонтальный список времён
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _timesForSelectedDate.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final time = _timesForSelectedDate[index];
                        final isSelected = time == _selectedTime;

                        return GestureDetector(
                          onTap: () => _onTimeSelected(time),
                          child: Container(
                            width: 90,
                            height: 36,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF261D08)
                                  : const Color(0xFF1C1C1C),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.amber
                                    : const Color(0xFF3A3A3A),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFFBFBFBF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ========== ИТОГО + КНОПКА ==========
                  if (_selectedSeatIds.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selected: ${_selectedSeatIds.join(', ')}',
                              style: const TextStyle(
                                color: Color(0xFFBFBFBF),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed:
                            (_selectedSeatIds.isEmpty || _selectedTime == null)
                            ? null
                            : _onContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCC434),
                          disabledBackgroundColor: const Color(0xFF3A3A3A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          _selectedSeatIds.isEmpty
                              ? 'Select seats'
                              : 'Continue  \$${_totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: _selectedSeatIds.isEmpty
                                ? const Color(0xFFBFBFBF)
                                : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    final start = DateTime(today.year, today.month - 1, today.day);
    final end = DateTime(today.year, today.month + 1, today.day);

    _dates = [];
    for (var d = start; !d.isAfter(end); d = d.add(const Duration(days: 1))) {
      _dates.add(DateTime(d.year, d.month, d.day));
    }

    _selectedDate = DateTime(today.year, today.month, today.day);
    _timesForSelectedDate = _generateTimesForDate(_selectedDate);
    _selectedTime = _timesForSelectedDate.isNotEmpty
        ? _timesForSelectedDate.first
        : null;

    // Генерируем reserved-места для выбранной даты
    _reservedMap = _generateReservedForDate(_selectedDate);
  }

  List<Seat> _buildSelectedSeatEntities() {
    return _selectedSeatIds.map((id) {
      final row = id[0]; // 'A', 'B'...
      final number = int.parse(id.substring(1));
      return Seat(
        id: id,
        row: row,
        number: number,
        price: _priceForSeat(row),
        status: SeatStatus.selected,
      );
    }).toList();
  }

  // ========== ГЕНЕРАЦИЯ RESERVED МЕСТ НА ДЕНЬ ==========
  Map<String, bool> _generateReservedForDate(DateTime date) {
    final seed = date.year * 10000 + date.month * 100 + date.day;
    final random = _SimpleRandom(seed);

    final map = <String, bool>{};

    for (final rowLabel in Consts.rowLabels) {
      for (int seatIndex = 0; seatIndex < Consts.seatsRow; seatIndex++) {
        final seatNumber = seatIndex + 2;
        final seatCode = '$rowLabel$seatNumber';

        // ~25–35% мест reserved (разное количество в разные дни)
        final chance = 25 + random.nextInt(11); // 25..35
        final isReserved = random.nextInt(100) < chance;

        // Фиксированные "вечные" reserved (например техническое)
        final alwaysReserved = (rowLabel == 'H' && seatNumber == 5);

        map[seatCode] = isReserved || alwaysReserved;
      }
    }
    return map;
  }

  // ========== DATE / TIME HELPERS ==========
  List<String> _generateTimesForDate(DateTime date) {
    final seed = date.year * 10000 + date.month * 100 + date.day;
    final random = _SimpleRandom(seed);

    final allSlots = <String>[];
    for (int hour = 10; hour <= 23; hour++) {
      allSlots.add('${hour.toString().padLeft(2, '0')}:00');
      if (hour < 23) {
        allSlots.add('${hour.toString().padLeft(2, '0')}:30');
      }
    }

    final count = 4 + random.nextInt(4);
    final selected = <String>{};

    while (selected.length < count && selected.length < allSlots.length) {
      selected.add(allSlots[random.nextInt(allSlots.length)]);
    }

    final result = selected.toList()
      ..sort((a, b) {
        final aParts = a.split(':').map(int.parse).toList();
        final bParts = b.split(':').map(int.parse).toList();
        return (aParts[0] * 60 + aParts[1]).compareTo(
          bParts[0] * 60 + bParts[1],
        );
      });

    return result;
  }

  String _monthAbbr(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  Future<void> _onContinue() async {
    if (_selectedSeatIds.isEmpty || _selectedTime == null) return;

    final cubit = context.read<BookingCubit>();

    // 1. Сохраняем сессию
    await cubit.onSelectSession(date: _selectedDate, time: _selectedTime!);

    // 2. Сохраняем места
    final seats = _buildSelectedSeatEntities();
    await cubit.onSelectSeats(seats);

    // 3. Переход на следующий экран
    if (mounted) {
      context.pushReplacement(AppRoutes.payment);
    }
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _timesForSelectedDate = _generateTimesForDate(date);
      _selectedTime = _timesForSelectedDate.isNotEmpty
          ? _timesForSelectedDate.first
          : null;

      // Меняем reserved-места под новый день
      _reservedMap = _generateReservedForDate(date);

      // Сбрасываем выбор мест при смене даты
      _selectedSeatIds.clear();
    });
  }

  void _onSeatTap(String seatCode) {
    final isReserved = _reservedMap[seatCode] ?? false;
    if (isReserved) return; // нельзя выбрать reserved

    setState(() {
      if (_selectedSeatIds.contains(seatCode)) {
        _selectedSeatIds.remove(seatCode);
      } else {
        _selectedSeatIds.add(seatCode);
      }
    });
  }

  void _onTimeSelected(String time) {
    setState(() => _selectedTime = time);
  }

  double _priceForSeat(String rowLabel) {
    // Первые два ряда — VIP
    if (Consts.rowLabels.isNotEmpty &&
        (rowLabel == Consts.rowLabels[0] ||
            (Consts.rowLabels.length > 1 && rowLabel == Consts.rowLabels[1]))) {
      return _vipPrice;
    }
    return _basePrice;
  }

  Color _seatColor(String seatCode) {
    final isSelected = _selectedSeatIds.contains(seatCode);
    final isReserved = _reservedMap[seatCode] ?? false;

    if (isSelected) {
      return _showSelected ? const Color(0xFFFCC434) : const Color(0xFF1C1C1C);
    }
    if (isReserved) {
      return _showReserved ? const Color(0xFF6B6B6B) : const Color(0xFF1C1C1C);
    }
    // Available
    return _showAvailable ? const Color(0xFF1C1C1C) : const Color(0xFF1C1C1C);
  }

  Color _textColor(String seatCode) {
    final isSelected = _selectedSeatIds.contains(seatCode);
    if (isSelected && _showSelected == false) {
      return Colors.amber;
    }

    if (_showSelected == true && isSelected) {
      return Colors.black;
    }

    return const Color(0xFFBFBFBF);
  }
}

/// Простой детерминированный генератор
class _SimpleRandom {
  int _seed;

  _SimpleRandom(this._seed);

  int nextInt(int max) {
    _seed = (_seed * 1103515245 + 12345) & 0x7fffffff;
    return _seed % max;
  }
}
