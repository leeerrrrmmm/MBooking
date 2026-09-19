import 'package:flutter/material.dart';

/// Полный боттом-бар для размещения в Stack:
/// - мягкое затемнение над самим баром
/// - отступ от нижнего края экрана
/// - 4 пункта (Home / Ticket / Movie / Profile) с иконкой и текстом
class BottomNavBar extends StatelessWidget {
  static const List<_NavBarItem> _items = [
    _NavBarItem(icon: Icons.home, label: 'Home'),
    _NavBarItem(icon: Icons.confirmation_number, label: 'Ticket'),
    _NavBarItem(icon: Icons.movie, label: 'Movie'),
    _NavBarItem(icon: Icons.person, label: 'Profile'),
  ];
  static const Color _activeColor = Color(0xFFFCC434);

  static const Color _inactiveColor = Color(0xFFCCCCCC);

  final bool isKeyboardVisible;

  /// Индекс активного пункта (0 - Home, 1 - Ticket, 2 - Movie, 3 - Profile)
  final int selectedIndex;

  /// Колбэк при нажатии на пункт
  final ValueChanged<int> onItemTapped;
  const BottomNavBar({
    super.key,
    required this.isKeyboardVisible,
    this.selectedIndex = 1,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isKeyboardVisible ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedScale(
        scale: isKeyboardVisible ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: isKeyboardVisible
            ? const SizedBox(width: double.infinity, height: 0)
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Сам бар с отступом от нижнего края экрана
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.only(
                      bottom: 8 + MediaQuery.viewPaddingOf(context).bottom,
                      left: 24,
                      right: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1C),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xFF2A2A2A)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x66000000),
                          blurRadius: 24,
                          offset: Offset(0, -4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: List.generate(_items.length, (index) {
                        final item = _items[index];
                        final isActive = index == selectedIndex;
                        final color = isActive ? _activeColor : _inactiveColor;

                        return Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => onItemTapped(index),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                ),
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? const Color(0x1AFCC434)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedScale(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      scale: isActive ? 1 : 0.7,
                                      child: Icon(
                                        item.icon,
                                        size: 26,
                                        color: color,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.label,
                                      style: TextStyle(
                                        fontSize: isActive ? 12 : 10,
                                        fontWeight: isActive
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        color: color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Варианты пунктов нижнего навигационного бора
class _NavBarItem {
  final IconData icon;

  final String label;
  const _NavBarItem({required this.icon, required this.label});
}
