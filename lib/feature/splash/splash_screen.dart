// feature/splash/presentation/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const _word = 'MBoOking';

  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _bounceAnimations;
  late final List<Animation<double>> _fadeAnimations;

  bool _animationDone = false;
  bool _authResolved = false;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startAnimations();
    _waitForAuth();
  }

  void _initAnimations() {
    _controllers = List.generate(
      _word.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
      ),
    );

    _bounceAnimations = _controllers.map((c) {
      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: -80.0,
            end: 12.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 60,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 12.0,
            end: -8.0,
          ).chain(CurveTween(curve: Curves.easeInOut)),
          weight: 20,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: -8.0,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 20,
        ),
      ]).animate(c);
    }).toList();

    _fadeAnimations = _controllers.map((c) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: c,
          curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
        ),
      );
    }).toList();
  }

  Future<void> _startAnimations() async {
    for (var i = 0; i < _controllers.length; i++) {
      // небольшая задержка между буквами
      await Future.delayed(Duration(milliseconds: 90 + i * 20));
      if (!mounted) return;
      _controllers[i].forward();
    }

    // ждём окончания последней буквы + чуть паузы
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    setState(() => _animationDone = true);
    _tryNavigate();
  }

  void _waitForAuth() {
    final cubit = context.read<CurrentUserCubit>();

    if (cubit.state.isResolved) {
      _authResolved = true;
      _tryNavigate();
      return;
    }

    cubit.stream.listen((state) {
      if (!mounted || _authResolved) return;

      if (state.isResolved) {
        _authResolved = true;
        _tryNavigate();
      }
    });
  }

  void _tryNavigate() {
    if (_navigated || !_animationDone || !_authResolved) return;
    _navigated = true;

    final state = context.read<CurrentUserCubit>().state;

    if (state.isLoggedIn) {
      context.go(AppRoutes.botBar);
    } else {
      context.go(AppRoutes.chooseAuthMethod);
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_word.length, (i) {
            final letter = _word[i];
            final isAccent = letter == 'o' || letter == 'O';

            return AnimatedBuilder(
              animation: _controllers[i],
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _bounceAnimations[i].value),
                  child: Opacity(
                    opacity: _fadeAnimations[i].value,
                    child: child,
                  ),
                );
              },
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: isAccent ? Colors.amber : Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
