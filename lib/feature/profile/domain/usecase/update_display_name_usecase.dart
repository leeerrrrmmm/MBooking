import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/core/utils/typedefs.dart';
import 'package:mbooking/feature/profile/domain/repo/profile_repository.dart';

class UpdateDisplayNameUseCase {
  UpdateDisplayNameUseCase(this._repository);

  final ProfileRepository _repository;

  FutureEither<void> call(String displayName) {
    final name = displayName.trim();
    if (name.isEmpty) {
      return Future.value(
        const Left(ValidationFailure('Name cannot be empty')),
      );
    }
    if (name.length < 2) {
      return Future.value(
        const Left(ValidationFailure('Name must be at least 2 characters')),
      );
    }
    return _repository.updateDisplayName(name);
  }
}
