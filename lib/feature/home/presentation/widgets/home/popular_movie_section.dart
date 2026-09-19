import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/components/futuristic_loader.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/capsule_page_indicator.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/pre_section_widget.dart';
import 'package:mbooking/router/app_routes.dart';

class PopularMoviesSection extends StatefulWidget {
  const PopularMoviesSection({super.key});

  @override
  State<PopularMoviesSection> createState() => _PopularMoviesSectionState();
}

class _PopularMoviesSectionState extends State<PopularMoviesSection> {
  late final PageController _pageController;
  double _currentPage = 1.0;
  static const _itemCount = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.9);
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (!_pageController.hasClients) return;
    final page = _pageController.page;
    if (page == null) return;
    if ((page - _currentPage).abs() > 0.001) {
      setState(() => _currentPage = page);
    }
  }

  void _syncPageAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pageController.hasClients) return;
      final page = _pageController.page ?? 1.0;
      if ((page - _currentPage).abs() > 0.001) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PreSectionWidget(title: 'Popular Movies', showSeeAll: true),
        const SizedBox(height: 12),
        SizedBox(
          height: 525,
          child: BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
            listener: (context, state) {
              if (state is PopularMoviesLoaded) {
                _syncPageAfterBuild();
              }
            },
            builder: (context, state) {
              // На refresh, если уже были данные — лучше не затирать UI.
              // Лоадер только когда ещё нечего показывать.
              if (state is PopularMoviesLoading) {
                return const Center(
                  child: FuturisticLoader(size: 72, label: 'LOADING MOVIES'),
                );
              }

              if (state is PopularMoviesError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white54),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.read<PopularMoviesCubit>().loadMovies(),
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Color(0xFFFCC434)),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is! PopularMoviesLoaded) {
                return const SizedBox.shrink();
              }

              final movies = state.movies;
              final count = movies.length < _itemCount
                  ? movies.length
                  : _itemCount;

              if (count == 0) {
                return const Center(
                  child: Text(
                    'No popular movies',
                    style: TextStyle(color: Colors.white54),
                  ),
                );
              }

              return PageView.builder(
                controller: _pageController,
                itemCount: count,
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                allowImplicitScrolling: true,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final genresText = movie.genres.isNotEmpty
                      ? movie.genres.map((g) => g.name).join(', ')
                      : 'No genres';

                  final distance = (_currentPage - index).abs().clamp(0.0, 1.0);
                  final isCentered = distance < 0.08; // чуть мягче порог
                  final hasPoster = movie.image.posterPath?.isNotEmpty == true;

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            '${AppRoutes.detailMovie}/${movie.id.value}',
                            extra: movie,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26),
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(12),
                                height: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
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
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : null,
                              ),
                              Positioned.fill(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 150),
                                  opacity: isCentered
                                      ? 0.0
                                      : (0.35 + distance * 0.35).clamp(
                                          0.0,
                                          0.7,
                                        ),
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: isCentered ? 1.0 : 0.0,
                        child: isCentered
                            ? Column(
                                children: [
                                  Text(
                                    movie.title.title,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    genresText,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFBFBFBF),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 30,
                                      ),
                                      Text(
                                        '${movie.rating.average} ',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '• (${movie.rating.voteCount} votes)',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFBFBFBF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox(height: 76),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        CapsulePageIndicator(
          controller: _pageController,
          itemCount: _itemCount,
        ),
      ],
    );
  }
}
