import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';

class MovieDetailsHeaderCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onWatchTrailer;

  const MovieDetailsHeaderCard({
    super.key,
    required this.movie,
    required this.onWatchTrailer,
  });

  @override
  Widget build(BuildContext context) {
    final runtime = movie.runtime != null && movie.runtime! > 0
        ? _formatRuntime(movie.runtime!)
        : null;
    final date = movie.releaseDate != null
        ? DateFormat('dd.MM.yyyy').format(movie.releaseDate!)
        : null;

    final parts = <String>[?runtime, ?date];
    final subtitle = parts.join(' • ');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: 13,
              ),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Review',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFCC434),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                movie.rating.average.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                ' (${_formatVotes(movie.rating.voteCount)})',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: List.generate(5, (i) {
                  final filled = movie.rating.average / 2;
                  return Icon(
                    i < filled.floor()
                        ? Icons.star_rounded
                        : (i < filled
                              ? Icons.star_half_rounded
                              : Icons.star_outline_rounded),
                    color: const Color(0xFFFCC434),
                    size: 22,
                  );
                }),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: onWatchTrailer,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF3A3A3A)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.play_arrow_rounded, size: 18),
                label: const Text(
                  'Watch trailer',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatRuntime(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h == 0) return '${m}m';
    return '${h}h${m.toString().padLeft(2, '0')}m';
  }

  String _formatVotes(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(count >= 10000 ? 0 : 1)}k';
    }
    return count.toString();
  }
}
