import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/presentation/screens/movie_screen.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/ticket_clipper.dart';
import 'package:mbooking/router/app_routes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  static const double _posterWidth = 96;
  static const double _seamWidth = 18;
  static const double _cardHeight = 132;

  String get _year {
    final raw = movie.releaseDate.toString();
    return raw.length >= 4 ? raw.substring(0, 4) : raw;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: GestureDetector(
        onTap: () => context.push(
          '${AppRoutes.detailMovie}/${movie.id.value}',
          extra: movie,
        ),
        child: ClipPath(
          clipper: TicketClipper(notchX: _posterWidth + _seamWidth / 2),
          child: Container(
            height: _cardHeight,
            color: kSurface,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: _posterWidth,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w342${movie.image.posterPath}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            color: Colors.white.withValues(alpha: 0.04),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.white.withValues(alpha: 0.04),
                          child: const Icon(
                            Icons.local_movies_outlined,
                            color: kMuted,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        bottom: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.55),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _year,
                            style: const TextStyle(
                              color: kGold,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: _seamWidth,
                  child: CustomPaint(
                    painter: PerforationPainter(
                      color: Colors.white.withValues(alpha: 0.14),
                    ),
                    size: const Size(_seamWidth, _cardHeight),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 14, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie.title.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          movie.overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                        const Spacer(),
                        const Row(
                          children: [
                            Icon(
                              Icons.confirmation_number_outlined,
                              size: 14,
                              color: kGold,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Book now',
                              style: TextStyle(
                                color: kGold,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
