part of 'detail_movie_cubit.dart';

class DetailMovieError extends DetailMovieState {
  final String message;

  const DetailMovieError(this.message);
}

class DetailMovieInitial extends DetailMovieState {
  const DetailMovieInitial();
}

class DetailMovieLoaded extends DetailMovieState {
  final Movie movie;

  const DetailMovieLoaded(this.movie);
}

class DetailMovieLoading extends DetailMovieState {
  const DetailMovieLoading();
}

sealed class DetailMovieState {
  const DetailMovieState();
}
