import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/core/network/connectivity_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/marquee_tab_bar.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/popular_movies_list.dart';
import 'package:mbooking/feature/home/presentation/widgets/movie/upcoming_movies_list.dart';

const kGold = Color(0xFFE8B84B);
const kSurface = Color(0xFF1C1C1E);
const kMuted = Color(0xFF8E8E93);

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with TickerProviderStateMixin {
  bool isRetrying = false;

  late final TabController tabController = TabController(
    vsync: this,
    length: 2,
  );

  Future<void> _reloadMovies() async {
    await Future.wait([
      context.read<PopularMoviesCubit>().loadMovies(page: 1, isRefresh: true),
      context.read<UpcomingMoviesCubit>().loadUpcomingMovies(
        page: 1,
        isRefresh: true,
      ),
    ]);
  }

  Future<void> _onRetry() async {
    setState(() => isRetrying = true);
    await context.read<ConnectivityCubit>().check();
    if (!mounted) return;
    await _reloadMovies();
    if (!mounted) return;
    setState(() => isRetrying = false);
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return BlocListener<ConnectivityCubit, ConnectivityStatus>(
      listenWhen: (prev, curr) =>
          prev == ConnectivityStatus.offline &&
          curr == ConnectivityStatus.online,
      listener: (context, status) => _reloadMovies(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: topInset + 68),
              child: RefreshIndicator(
                onRefresh: _onRetry,
                color: kGold,
                backgroundColor: kSurface,
                child: TabBarView(
                  controller: tabController,
                  children: const [PopularMoviesList(), UpcomingMoviesList()],
                ),
              ),
            ),
            Positioned(
              top: topInset + 12,
              left: 16,
              right: 16,
              child: MarqueeTabBar(controller: tabController),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
