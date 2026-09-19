import 'package:flutter/material.dart';

class CapsulePageIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;

  const CapsulePageIndicator({
    super.key,
    required this.controller,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    const double totalWidth = 61.0;
    const double height = 8.0;
    final double indicatorWidth = totalWidth / itemCount;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Получаем текущий прогресс скролла
        double currentPage = 0;
        if (controller.hasClients && controller.position.haveDimensions) {
          currentPage = controller.page ?? controller.initialPage.toDouble();
        } else {
          currentPage = controller.initialPage.toDouble();
        }

        // Вычисляем горизонтальный сдвиг ползунка
        final double maxOffset = totalWidth - indicatorWidth;
        final double progress = (itemCount > 1)
            ? (currentPage / (itemCount - 1))
            : 0;
        final double leftOffset = (progress * maxOffset).clamp(0.0, maxOffset);

        return Container(
          width: totalWidth,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF333333),
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Stack(
            children: [
              Positioned(
                left: leftOffset,
                top: 0,
                bottom: 0,
                width: indicatorWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCC434),
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
