import 'package:flutter/material.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';

class MovieDetailsHeaderImage extends StatelessWidget {
  final Movie movie;
  final double height;

  const MovieDetailsHeaderImage({
    super.key,
    required this.movie,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _Backdrop(movie: movie),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0x99000000),
                  Colors.black,
                ],
                stops: [0.0, 0.45, 0.8, 1.0],
              ),
            ),
          ),
          Positioned(
            top: topPadding + 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  final Movie movie;

  const _Backdrop({required this.movie});

  @override
  Widget build(BuildContext context) {
    final path = movie.image.backdropPath ?? movie.image.posterPath;
    if (path == null) {
      return Container(
        color: const Color(0xFF1C1C1C),
        child: const Center(
          child: Icon(Icons.movie, size: 80, color: Colors.white24),
        ),
      );
    }

    return Image.network(
      'https://image.tmdb.org/t/p/original$path',
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Container(color: const Color(0xFF1C1C1C)),
    );
  }
}
