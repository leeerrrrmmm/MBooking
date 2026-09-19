import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/core/utils/typedefs.dart';
import 'package:mbooking/feature/profile/domain/repo/profile_repository.dart';

class ChangePasswordUseCase {
  ChangePasswordUseCase(this._repository);

  final ProfileRepository _repository;

  FutureEither<void> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    if (currentPassword.isEmpty) {
      return Future.value(
        const Left(ValidationFailure('Enter your current password')),
      );
    }
    if (newPassword.length < 6) {
      return Future.value(
        const Left(
          ValidationFailure('New password must be at least 6 characters'),
        ),
      );
    }
    if (newPassword != confirmPassword) {
      return Future.value(
        const Left(ValidationFailure('Passwords do not match')),
      );
    }
    if (currentPassword == newPassword) {
      return Future.value(
        const Left(ValidationFailure('New password must be different')),
      );
    }
    return _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
