import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/usecases/movie/fetch_popular_movies.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final FetchPopularMovies _fetchPopularMovies;

  bool _isLoadingMore = false;
  PopularMoviesCubit(this._fetchPopularMovies)
    : super(const PopularMoviesInitial());

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! PopularMoviesLoaded ||
        currentState.hasReachedMax ||
        _isLoadingMore) {
      return;
    }

    _isLoadingMore = true;
    try {
      await loadMovies(page: currentState.currentPage + 1);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> loadMovies({int page = 1, bool isRefresh = false}) async {
    final current = state;

    if (page == 1 && !isRefresh) {
      emit(const PopularMoviesLoading());
    } else if (page > 1 && current is PopularMoviesLoaded) {
      emit(
        PopularMoviesLoaded(
          movies: current.movies,
          currentPage: current.currentPage,
          hasReachedMax: current.hasReachedMax,
          isLoadingMore: true,
        ),
      );
    }

    try {
      final movies = await _fetchPopularMovies(page: page);
      if (isClosed) return;

      final previous = current is PopularMoviesLoaded && page > 1
          ? current.movies
          : const <Movie>[];

      emit(
        PopularMoviesLoaded(
          movies: [...previous, ...movies],
          currentPage: page,
          hasReachedMax: movies.length < 20,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      if (isClosed) return;
      if (page > 1 && current is PopularMoviesLoaded) {
        emit(
          PopularMoviesLoaded(
            movies: current.movies,
            currentPage: current.currentPage,
            hasReachedMax: current.hasReachedMax,
            isLoadingMore: false,
          ),
        );
        return;
      }
      emit(PopularMoviesError(e.toString()));
    }
  }

  Future<void> refresh() => loadMovies(page: 1);
}
