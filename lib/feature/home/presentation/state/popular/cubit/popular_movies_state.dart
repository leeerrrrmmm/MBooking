part of 'popular_movies_cubit.dart';

class PopularMoviesError extends PopularMoviesState {
  final String message;

  const PopularMoviesError(this.message);
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoaded extends PopularMoviesState {
  const PopularMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.hasReachedMax,
    this.isLoadingMore = false,
  });

  final List<Movie> movies;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore;

  PopularMoviesLoaded copyWith({
    List<Movie>? movies,
    int? currentPage,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return PopularMoviesLoaded(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

sealed class PopularMoviesState {
  const PopularMoviesState();
}
