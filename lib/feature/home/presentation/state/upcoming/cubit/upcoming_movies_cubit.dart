import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/usecases/movie/fetch_upcoming_movies.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final FetchUpcomingMovies _fetchUpcomingMovies;
  bool _isLoadingMore = false;

  UpcomingMoviesCubit(this._fetchUpcomingMovies)
    : super(const UpcomingMoviesInitial());

  Future<void> loadMore() async {
    final curState = state;

    if (curState is! UpcomingMoviesLoaded ||
        curState.hasReachedMax ||
        _isLoadingMore) {
      return;
    }

    _isLoadingMore = true;

    try {
      await loadUpcomingMovies(page: curState.currentPage + 1);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> loadUpcomingMovies({
    int page = 1,
    bool isRefresh = false,
  }) async {
    final current = state;

    // Полный лоадер только при первой загрузке / refresh
    if (page == 1 && !isRefresh) {
      emit(const UpcomingMoviesLoading());
    } else if (page > 1 && current is UpcomingMoviesLoaded) {
      // Показываем индикатор внизу списка
      emit(
        UpcomingMoviesLoaded(
          movies: current.movies,
          currentPage: current.currentPage,
          hasReachedMax: current.hasReachedMax,
          isLoadingMore: true,
        ),
      );
    }

    try {
      final upcomingMovies = await _fetchUpcomingMovies(page: page);
      if (isClosed) return;

      final previous = current is UpcomingMoviesLoaded && page > 1
          ? current.movies
          : const <Movie>[];

      emit(
        UpcomingMoviesLoaded(
          movies: [...previous, ...upcomingMovies],
          currentPage: page,
          hasReachedMax: upcomingMovies.length < 20,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      if (isClosed) return;

      // При ошибке подгрузки просто убираем индикатор, список не трогаем
      if (page > 1 && current is UpcomingMoviesLoaded) {
        emit(
          UpcomingMoviesLoaded(
            movies: current.movies,
            currentPage: current.currentPage,
            hasReachedMax: current.hasReachedMax,
            isLoadingMore: false,
          ),
        );
        return;
      }

      emit(UpcomingMoviesError(e.toString()));
    }
  }

  Future<void> refresh() => loadUpcomingMovies(page: 1, isRefresh: true);
}
