import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/components/bot_bar.dart';
import 'package:mbooking/core/di/injection.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/core/utils/go_router_refresh_stream.dart';
import 'package:mbooking/feature/auth/presentation/screens/choose_auth_method_screen.dart';
import 'package:mbooking/feature/auth/presentation/screens/login_screen.dart';
import 'package:mbooking/feature/auth/presentation/screens/register_screen.dart';
import 'package:mbooking/feature/booking/presentation/screens/select_seats_screen.dart';
import 'package:mbooking/feature/booking/presentation/state/cubit/booking_cubit.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/presentation/screens/detail_movie_screen.dart';
import 'package:mbooking/feature/home/presentation/state/detail/cubit/detail_movie_cubit.dart';
import 'package:mbooking/feature/payment/presentation/screen/payment_screen.dart';
import 'package:mbooking/feature/payment/presentation/state/cubit/payment_cubit.dart';
import 'package:mbooking/feature/splash/splash_screen.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/presentation/screen/detail_ticket_screen.dart';
import 'package:mbooking/feature/ticket/presentation/screen/ticket_screen.dart';
import 'package:mbooking/feature/ticket/presentation/state/cubit/ticket_list_cubit.dart';
import 'package:mbooking/router/app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash, // ← старт со splash
  refreshListenable: GoRouterRefreshStream(sl<CurrentUserCubit>().stream),
  redirect: (context, state) {
    final session = sl<CurrentUserCubit>().state;
    final location = state.matchedLocation;

    final isLoggedIn = session.isLoggedIn;
    final isSplash = location == AppRoutes.splash;
    final isAuthRoute =
        location == AppRoutes.chooseAuthMethod ||
        location == AppRoutes.login ||
        location == AppRoutes.register;

    if (isSplash) return null;

    if (!session.isResolved) {
      return AppRoutes.splash;
    }

    if (!isLoggedIn && !isAuthRoute) {
      return AppRoutes.chooseAuthMethod;
    }

    if (isLoggedIn && isAuthRoute) {
      return AppRoutes.botBar;
    }

    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => SafeArea(child: child),
      routes: [
        // ===============================================
        // Start Screens
        // ===============================================
        // Splash
        GoRoute(
          path: AppRoutes.splash,
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: AppRoutes.chooseAuthMethod,
          name: 'choose-auth-method',
          builder: (context, state) => const ChooseAuthMethodScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.register,
          name: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),

        // ===============================================
        // Bottom Bar Screen
        // ===============================================
        GoRoute(
          path: AppRoutes.botBar,
          name: 'bot-bar',
          builder: (context, state) => const BotBar(),
        ),

        // ===============================================
        // Booking Flow (Details -> Select Seats -> ...)
        // Общий BookingCubit живёт, пока активен хотя бы
        // один экран внутри этого ShellRoute
        // ===============================================
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) => sl<BookingCubit>(),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '${AppRoutes.detailMovie}/:id',
              name: 'detail-movie',
              builder: (context, state) {
                final movieId = int.parse(state.pathParameters['id']!);
                final initialMovie = state.extra as Movie?;

                return BlocProvider(
                  create: (_) =>
                      sl<DetailMovieCubit>()..fetchMovieDetails(id: movieId),
                  child: MovieDetailsScreen(initialMovie: initialMovie),
                );
              },
            ),
            GoRoute(
              path: AppRoutes.selectSeats,
              name: 'select-seats',
              builder: (context, state) => const SelectSeatsScreen(),
            ),
            GoRoute(
              path: AppRoutes.payment,
              name: 'payment',
              builder: (context, state) {
                return BlocProvider(
                  create: (_) => sl<PaymentCubit>(),
                  child: const PaymentScreen(),
                );
              },
            ),
            GoRoute(
              path: AppRoutes.ticket,
              name: 'ticket',
              builder: (context, state) {
                return BlocProvider(
                  create: (_) => sl<TicketsListCubit>()..load(),
                  child: const TicketScreen(),
                );
              },
            ),
            GoRoute(
              path: AppRoutes.detailTicket,
              name: 'detail-ticket',
              builder: (context, state) {
                final ticket = state.extra as TicketEntity;
                return DetailTicketScreen(ticket: ticket);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
