import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_in_with_email_usecase.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_out_usecase.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_up_with_email_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.signInWithEmail,
    required this.signUpWithEmail,
    required this.signOut,
  }) : super(const AuthInitial());

  final SignInWithEmailUseCase signInWithEmail;
  final SignUpWithEmailUseCase signUpWithEmail;
  final SignOutUseCase signOut;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await signInWithEmail(email: email, password: password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthSuccess()),
    );
  }

  Future<void> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    emit(const AuthLoading());
    final result = await signUpWithEmail(
      email: email,
      password: password,
      displayName: displayName,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthSuccess()),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await signOut();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthInitial()),
    );
  }
}
