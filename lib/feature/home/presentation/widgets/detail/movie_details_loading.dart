import 'package:flutter/material.dart';
import 'package:mbooking/components/futuristic_loader.dart';

class MovieDetailsLoading extends StatelessWidget {
  const MovieDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: FuturisticLoader(size: 84, label: 'LOADING MOVIE')),
    );
  }
}
