import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/presentation/screens/movie_screen.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/movie_card.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({super.key});

  @override
  State<PopularMoviesList> createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final pos = _controller.position;
    if (pos.pixels < pos.maxScrollExtent - 240) return;
    context.read<PopularMoviesCubit>().loadMore();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const Center(child: CircularProgressIndicator(color: kGold));
        }

        if (state is PopularMoviesError) {
          return Center(child: Text(state.message));
        }

        if (state is! PopularMoviesLoaded) {
          return const SizedBox.shrink();
        }

        final showFooter = state.isLoadingMore || !state.hasReachedMax;

        return RefreshIndicator(
          color: kGold,
          onRefresh: () => context.read<PopularMoviesCubit>().loadMovies(
            page: 1,
            isRefresh: true,
          ),
          child: ListView.builder(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.only(top: 4, bottom: 100),
            itemCount: state.movies.length + (showFooter ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.movies.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator(color: kGold)),
                );
              }
              return MovieCard(movie: state.movies[index]);
            },
          ),
        );
      },
    );
  }
}
