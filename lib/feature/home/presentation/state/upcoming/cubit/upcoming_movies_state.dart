part of 'upcoming_movies_cubit.dart';

class UpcomingMoviesError extends UpcomingMoviesState {
  final String message;
  const UpcomingMoviesError(this.message);
}

class UpcomingMoviesInitial extends UpcomingMoviesState {
  const UpcomingMoviesInitial();
}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<Movie> movies;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore;
  const UpcomingMoviesLoaded({
    required this.movies,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });
}

class UpcomingMoviesLoading extends UpcomingMoviesState {
  const UpcomingMoviesLoading();
}

sealed class UpcomingMoviesState {
  const UpcomingMoviesState();
}
