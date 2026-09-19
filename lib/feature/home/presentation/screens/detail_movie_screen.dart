import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/presentation/state/detail/cubit/detail_movie_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_details_content.dart';
import 'package:mbooking/feature/home/presentation/widgets/detail/movie_details_loading.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie? initialMovie;

  const MovieDetailsScreen({super.key, this.initialMovie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieCubit, DetailMovieState>(
      builder: (context, state) {
        if (state is DetailMovieLoaded) {
          return MovieDetailsContent(movie: state.movie);
        }

        if (state is DetailMovieError) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        // Initial / Loading — лоадер до полной загрузки
        return const MovieDetailsLoading();
      },
    );
  }
}
