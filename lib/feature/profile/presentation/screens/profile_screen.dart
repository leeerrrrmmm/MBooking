import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/feature/auth/presentation/state/cubit/auth_cubit.dart';
import 'package:mbooking/feature/profile/presentation/state/cubit/profile_cubit.dart';
import 'package:mbooking/feature/profile/presentation/widgets/change_password_sheet.dart';
import 'package:mbooking/feature/profile/presentation/widgets/edit_name_sheet.dart';
import 'package:mbooking/feature/profile/presentation/widgets/profile_header.dart';
import 'package:mbooking/feature/profile/presentation/widgets/profile_menu.dart';
import 'package:mbooking/router/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricsEnabled = false;

  void _showMessage(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade700 : Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (prev, curr) =>
              curr.message != null && prev.message != curr.message,
          listener: (context, state) {
            if (state.message == null) return;
            _showMessage(
              state.message!,
              isError: state.status == ProfileStatus.error,
            );
            context.read<ProfileCubit>().consumeMessage();
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              _showMessage(state.message, isError: true);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          title: const Text('Profile', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: BlocBuilder<CurrentUserCubit, CurrentUserState>(
          builder: (context, state) {
            final user = state.user;
            if (user == null) {
              return const Center(
                child: Text(
                  'User not found',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(
                    user: user,
                    onEdit: () => showEditNameSheet(
                      context: context,
                      currentName: user.displayName ?? '',
                    ),
                  ),
                  const SizedBox(height: 32),
                  ProfileMenu(
                    biometricsEnabled: _biometricsEnabled,
                    onMyTicket: () => context.push(AppRoutes.ticket),
                    onPaymentHistory: () {},
                    onChangeLanguage: () {},
                    onChangePassword: () => showChangePasswordSheet(context),
                    onBiometricsChanged: (value) {
                      setState(() => _biometricsEnabled = value);
                    },
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, authState) {
                      final isSigningOut = authState is AuthLoading;
                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: isSigningOut
                              ? null
                              : () => context.read<AuthCubit>().logout(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            isSigningOut ? 'Signing out...' : 'Sign out',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
