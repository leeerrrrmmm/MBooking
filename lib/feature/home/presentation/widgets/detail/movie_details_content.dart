import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/core/const/consts.dart';
import 'package:mbooking/feature/booking/presentation/state/cubit/booking_cubit.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/cinema_card.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_details_header_card.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_details_header_image.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_expandable_overview.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_meta_row.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_people_row.dart';
import 'package:mbooking/router/app_routes.dart';

class MovieDetailsContent extends StatefulWidget {
  final Movie movie;

  const MovieDetailsContent({super.key, required this.movie});

  @override
  State<MovieDetailsContent> createState() => _MovieDetailsContentState();
}

class _MovieDetailsContentState extends State<MovieDetailsContent> {
  int _selectedCinemaIndex = 0;

  Movie get movie => widget.movie;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final directors = _mapDirectors();
    final actors = _mapActors();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                MovieDetailsHeaderImage(movie: movie),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Column(
                    children: [
                      MovieDetailsHeaderCard(
                        movie: movie,
                        onWatchTrailer: _onWatchTrailer,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MovieMetaRow(
                              label: 'Movie genre:',
                              value: movie.genres.isNotEmpty
                                  ? movie.genres.map((g) => g.name).join(', ')
                                  : '—',
                            ),
                            const SizedBox(height: 10),
                            MovieMetaRow(
                              label: 'Censorship:',
                              value: (movie.certification?.isNotEmpty ?? false)
                                  ? movie.certification!
                                  : '—',
                            ),
                            const SizedBox(height: 10),
                            MovieMetaRow(
                              label: 'Language:',
                              value: _languageName(movie.originalLanguage),
                            ),
                            const SizedBox(height: 28),
                            const Text(
                              'Storyline',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            MovieExpandableOverview(overview: movie.overview),
                            const SizedBox(height: 28),
                            if (directors.isNotEmpty) ...[
                              Text(
                                directors.length == 1
                                    ? 'Director'
                                    : 'Directors',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 14),
                              MoviePeopleRow(people: directors),
                              const SizedBox(height: 28),
                            ],
                            if (actors.isNotEmpty) ...[
                              Text(
                                actors.length == 1 ? 'Actor' : 'Actors',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 14),
                              MoviePeopleRow(people: actors),
                              const SizedBox(height: 28),
                            ],
                            const Text(
                              'Cinema',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ...List.generate(Consts.cinemas.length, (index) {
                              final c = Consts.cinemas[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: index == Consts.cinemas.length - 1
                                      ? 0
                                      : 10,
                                ),
                                child: CinemaCard(
                                  name: c.name,
                                  distance: c.distance,
                                  address: c.address,
                                  selected: _selectedCinemaIndex == index,
                                  onTap: () {
                                    setState(
                                      () => _selectedCinemaIndex = index,
                                    );
                                  },
                                ),
                              );
                            }),
                            SizedBox(height: 100 + bottomPadding),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 16 + bottomPadding,
            child: SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: _onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFCC434),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<MoviePersonUi> _mapActors() {
    final cast = movie.movieCredits?.cast;
    if (cast == null || cast.isEmpty) return [];
    return cast.take(12).map((a) {
      return MoviePersonUi(
        name: a.name,
        imageUrl: _profileUrl(a.profilePath),
        subtitle: a.character,
      );
    }).toList();
  }

  List<MoviePersonUi> _mapDirectors() {
    final directors = movie.movieCredits?.directors;
    if (directors == null || directors.isEmpty) return [];
    return directors
        .map(
          (d) =>
              MoviePersonUi(name: d.name, imageUrl: _profileUrl(d.profilePath)),
        )
        .toList();
  }

  String? _profileUrl(String? path) {
    if (path == null || path.isEmpty) return null;
    return 'https://image.tmdb.org/t/p/w185$path';
  }

  String _languageName(String code) {
    const map = {
      'en': 'English',
      'ru': 'Russian',
      'uk': 'Ukrainian',
      'fr': 'French',
      'de': 'German',
      'es': 'Spanish',
      'it': 'Italian',
      'ja': 'Japanese',
      'ko': 'Korean',
      'zh': 'Chinese',
    };
    return map[code] ?? code.toUpperCase();
  }

  void _onContinue() {
    final cinema = Consts.cinemas[_selectedCinemaIndex];
    context.read<BookingCubit>().onDetailsContinue(
      movieId: movie.id.value,
      title: movie.title.title,
      posterPath: movie.image.posterPath,
      genres: movie.genres.map((g) => g.name).toList(),
      cinemaId: cinema.id.toString(),
      cinemaName: cinema.name,
      cinemaAddress: cinema.address,
    );
    context.pushReplacement(AppRoutes.selectSeats);
  }

  void _onWatchTrailer() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trailer will be available soon'),
        backgroundColor: Color(0xFF2A2A2A),
      ),
    );
  }
}
