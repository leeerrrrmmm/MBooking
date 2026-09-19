import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/usecases/detail/fetch_movie_details.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  final FetchMovieDetailsUsecase _fetchMovieDetailsUsecase;
  DetailMovieCubit(this._fetchMovieDetailsUsecase)
    : super(DetailMovieInitial());

  Future<void> fetchMovieDetails({required int id}) async {
    emit(const DetailMovieLoading());

    try {
      final movie = await _fetchMovieDetailsUsecase(id: id);
      if (isClosed) return;
      emit(DetailMovieLoaded(movie));
    } catch (e) {
      if (isClosed) return;
      emit(DetailMovieError(e.toString()));
    }
  }
}
