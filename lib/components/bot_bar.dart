import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/components/botton_nav_bar.dart';
import 'package:mbooking/core/di/injection.dart';
import 'package:mbooking/core/network/connectivity_cubit.dart';
import 'package:mbooking/feature/home/presentation/screens/home_screen.dart';
import 'package:mbooking/feature/home/presentation/screens/movie_screen.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/profile/presentation/screens/profile_screen.dart';
import 'package:mbooking/feature/profile/presentation/state/cubit/profile_cubit.dart';
import 'package:mbooking/feature/ticket/presentation/screen/ticket_screen.dart';
import 'package:mbooking/feature/ticket/presentation/state/cubit/ticket_list_cubit.dart';

class BotBar extends StatefulWidget {
  const BotBar({super.key});

  @override
  State<BotBar> createState() => _BotBarState();
}

class _BotBarState extends State<BotBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              // 0 — Home
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: sl<ConnectivityCubit>()),
                  BlocProvider(
                    create: (_) => sl<PopularMoviesCubit>()..loadMovies(),
                  ),
                  BlocProvider(
                    create: (_) =>
                        sl<UpcomingMoviesCubit>()..loadUpcomingMovies(),
                  ),
                ],
                child: const HomeScreen(),
              ),

              BlocProvider(
                create: (_) => sl<TicketsListCubit>()..load(),
                child: const TicketScreen(),
              ),

              // 2 — Movies (заглушка)
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: sl<ConnectivityCubit>()),
                  BlocProvider(
                    create: (_) => sl<PopularMoviesCubit>()..loadMovies(),
                  ),
                  BlocProvider(
                    create: (_) =>
                        sl<UpcomingMoviesCubit>()..loadUpcomingMovies(),
                  ),
                ],
                child: const MovieScreen(),
              ),

              MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => sl<ProfileCubit>()),
                  BlocProvider(create: (_) => sl<TicketsListCubit>()..load()),
                ],
                child: const ProfileScreen(),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              isKeyboardVisible: isKeyboardVisible,
              selectedIndex: _selectedIndex,
              onItemTapped: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ],
      ),
    );
  }
}
