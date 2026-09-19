import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mbooking/feature/home/presentation/screens/movie_screen.dart';

class MarqueeTabBar extends StatelessWidget {
  const MarqueeTabBar({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: TabBar(
            controller: controller,
            splashBorderRadius: BorderRadius.circular(999),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: kGold,
              borderRadius: BorderRadius.circular(999),
            ),
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            labelColor: const Color(0xFF1B1404),
            unselectedLabelColor: Colors.white.withValues(alpha: 0.55),
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(height: 40, text: 'Popular'),
              Tab(height: 40, text: 'Upcoming'),
            ],
          ),
        ),
      ),
    );
  }
}
