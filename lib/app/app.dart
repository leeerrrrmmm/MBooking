import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/core/di/injection.dart';
import 'package:mbooking/core/theme/app_theme.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/feature/auth/presentation/state/cubit/auth_cubit.dart';
import 'package:mbooking/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentUserCubit>.value(value: sl<CurrentUserCubit>()),
        BlocProvider<AuthCubit>.value(value: sl<AuthCubit>()),
      ],
      child: MaterialApp.router(
        title: 'MBooking',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        routerConfig: appRouter,
      ),
    );
  }
}
