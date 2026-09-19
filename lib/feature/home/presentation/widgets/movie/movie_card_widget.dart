import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/router/app_routes.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.movie});

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
    // Marquee gold — the one accent this screen spends its boldness on.
    const kGold = Color(0xFFE8B84B);
    final kSurface = Color(0xFF1C1C1E);
    final kMuted = Color(0xFF8E8E93);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: GestureDetector(
        onTap: () => context.push(
          '${AppRoutes.detailMovie}/${movie.id.value}',
          extra: movie,
        ),
        child: ClipPath(
          clipper: _TicketClipper(
            notchX: _posterWidth + _seamWidth / 2,
            notchRadius: 7,
            radius: 16,
          ),
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
                          child: Icon(
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
                    painter: _PerforationPainter(
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
                        Row(
                          children: const [
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

class _TicketClipper extends CustomClipper<Path> {
  _TicketClipper({
    required this.notchX,
    required this.notchRadius,
    required this.radius,
  });

  final double notchX;
  final double notchRadius;
  final double radius;

  @override
  Path getClip(Size size) {
    final base = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );
    final notches = Path()
      ..addOval(Rect.fromCircle(center: Offset(notchX, 0), radius: notchRadius))
      ..addOval(
        Rect.fromCircle(
          center: Offset(notchX, size.height),
          radius: notchRadius,
        ),
      );
    return Path.combine(PathOperation.difference, base, notches);
  }

  @override
  bool shouldReclip(covariant _TicketClipper oldClipper) =>
      oldClipper.notchX != notchX;
}

/// Dashed vertical seam between the poster and the details panel.
class _PerforationPainter extends CustomPainter {
  _PerforationPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    const dash = 4.0;
    const gap = 4.0;
    final x = size.width / 2;
    double y = 10;
    while (y < size.height - 10) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dash), paint);
      y += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _PerforationPainter oldDelegate) => false;
}
