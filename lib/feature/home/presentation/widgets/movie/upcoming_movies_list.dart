import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/presentation/screens/movie_screen.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/movie_card.dart';

class UpcomingMoviesList extends StatefulWidget {
  const UpcomingMoviesList({super.key});

  @override
  State<UpcomingMoviesList> createState() => _UpcomingMoviesListState();
}

class _UpcomingMoviesListState extends State<UpcomingMoviesList> {
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
    context.read<UpcomingMoviesCubit>().loadMore();
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
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesLoading) {
          return const Center(child: CircularProgressIndicator(color: kGold));
        }

        if (state is UpcomingMoviesError) {
          return Center(child: Text(state.message));
        }

        if (state is! UpcomingMoviesLoaded) {
          return const SizedBox.shrink();
        }

        final showFooter = state.isLoadingMore || !state.hasReachedMax;

        return RefreshIndicator(
          color: kGold,
          onRefresh: () => context
              .read<UpcomingMoviesCubit>()
              .loadUpcomingMovies(page: 1, isRefresh: true),
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
