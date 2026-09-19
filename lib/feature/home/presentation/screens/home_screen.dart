import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/components/futuristic_loader.dart';
import 'package:mbooking/core/network/connectivity_cubit.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/no_internet_overlay.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/popular_movie_section.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/search_field_widget.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/upcoming_section_widget.dart';
import 'package:mbooking/feature/home/presentation/widgets/home/welcome_back_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isRetrying = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onRetry() async {
    setState(() => _isRetrying = true);
    await context.read<ConnectivityCubit>().check();
    if (!mounted) return;
    await _reloadMovies();
    if (!mounted) return;
    setState(() => _isRetrying = false);
  }

  Future<void> _reloadMovies() async {
    await Future.wait([
      context.read<PopularMoviesCubit>().loadMovies(isRefresh: true),
      context.read<UpcomingMoviesCubit>().loadUpcomingMovies(isRefresh: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityStatus>(
      listenWhen: (prev, curr) =>
          prev == ConnectivityStatus.offline &&
          curr == ConnectivityStatus.online,
      listener: (context, _) => _reloadMovies(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Stack(
          children: [
            // ===== CONTENT =====
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RefreshIndicator(
                  color: const Color(0xFFFCC434),
                  onRefresh: _reloadMovies,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<CurrentUserCubit, CurrentUserState>(
                          builder: (context, state) {
                            return WelcomeBackTextWidget(
                              userName: state.user?.greetingName ?? 'User',
                            );
                          },
                        ),
                        SearchFieldWidget(searchController: _searchController),
                        const PopularMoviesSection(),
                        const SizedBox(height: 32),
                        const UpcomingSectionWidget(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ===== FULL-SCREEN LOADER until BOTH loaded =====
            BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
              builder: (context, popular) {
                return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
                  builder: (context, upcoming) {
                    final popularReady = popular is PopularMoviesLoaded;
                    final upcomingReady = upcoming is UpcomingMoviesLoaded;

                    final hasError =
                        popular is PopularMoviesError ||
                        upcoming is UpcomingMoviesError;

                    // Пока хоть один не Loaded и нет ошибки — полный лоадер
                    final showLoader = !popularReady || !upcomingReady;
                    if (!showLoader || hasError) {
                      return const SizedBox.shrink();
                    }

                    return const ColoredBox(
                      color: Color(0xFF121212),
                      child: Center(
                        child: FuturisticLoader(
                          size: 84,
                          label: 'SYNCING REELS',
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            // ===== OFFLINE OVERLAY =====
            BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
              builder: (context, status) {
                final isOffline = status == ConnectivityStatus.offline;
                return IgnorePointer(
                  ignoring: !isOffline,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isOffline ? 1 : 0,
                    child: NoInternetOverlay(
                      isRetrying: _isRetrying,
                      onRetry: _onRetry,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
