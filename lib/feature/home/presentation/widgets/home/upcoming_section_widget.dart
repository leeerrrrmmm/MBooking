import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mbooking/components/futuristic_loader.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/pre_section_widget.dart';

class UpcomingSectionWidget extends StatelessWidget {
  const UpcomingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PreSectionWidget(title: 'Upcoming Movies', showSeeAll: true),
        const SizedBox(height: 12),
        SizedBox(
          height: 344,
          child: BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
            builder: (context, state) {
              if (state is UpcomingMoviesLoading ||
                  (state is! UpcomingMoviesLoaded &&
                      state is! UpcomingMoviesError)) {
                return const Center(
                  child: FuturisticLoader(size: 72, label: 'LOADING MOVIES'),
                );
              }

              if (state is UpcomingMoviesError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white54),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => context
                            .read<UpcomingMoviesCubit>()
                            .loadUpcomingMovies(),
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Color(0xFFFCC434)),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final movies = (state as UpcomingMoviesLoaded).movies;
              if (movies.isEmpty) {
                return const Center(
                  child: Text(
                    'No upcoming movies',
                    style: TextStyle(color: Colors.white54),
                  ),
                );
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: movies.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final genresText = movie.genres.isNotEmpty
                      ? movie.genres.map((g) => g.name).join(', ')
                      : 'No genres';
                  final hasPoster = movie.image.posterPath?.isNotEmpty == true;

                  return SizedBox(
                    width: 154,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 154,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFF1C1C1C),
                            image: hasPoster
                                ? DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${movie.image.posterPath}',
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: !hasPoster
                              ? const Center(
                                  child: Icon(
                                    Icons.movie,
                                    color: Colors.white24,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.title.originalTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFFCC434),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.local_movies_outlined,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                genresText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatReleaseDate(movie.releaseDate),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatReleaseDate(DateTime? date) {
    if (date == null) return '—';
    return DateFormat('dd MMMM yyyy').format(date);
  }
}
