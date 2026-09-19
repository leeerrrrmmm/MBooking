import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/profile/domain/usecase/change_password_usecase.dart';
import 'package:mbooking/feature/profile/domain/usecase/update_display_name_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required UpdateDisplayNameUseCase updateDisplayName,
    required ChangePasswordUseCase changePassword,
  }) : _updateDisplayName = updateDisplayName,
       _changePassword = changePassword,
       super(const ProfileState());

  final UpdateDisplayNameUseCase _updateDisplayName;
  final ChangePasswordUseCase _changePassword;

  Future<void> updateDisplayName(String displayName) async {
    emit(state.copyWith(status: ProfileStatus.updatingName, message: null));
    final result = await _updateDisplayName(displayName);
    result.fold(
      (failure) => emit(
        state.copyWith(status: ProfileStatus.error, message: failure.message),
      ),
      (_) => emit(
        state.copyWith(status: ProfileStatus.success, message: 'Name updated'),
      ),
    );
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(state.copyWith(status: ProfileStatus.changingPassword, message: null));
    final result = await _changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(status: ProfileStatus.error, message: failure.message),
      ),
      (_) => emit(
        state.copyWith(
          status: ProfileStatus.success,
          message: 'Password updated',
        ),
      ),
    );
  }

  void consumeMessage() {
    if (state.message == null) return;
    emit(state.copyWith(status: ProfileStatus.idle, message: null));
  }
}
