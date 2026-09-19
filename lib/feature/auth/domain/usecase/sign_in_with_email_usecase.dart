import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/core/user/domain/entity/current_user.dart';
import 'package:mbooking/core/utils/typedefs.dart';
import 'package:mbooking/feature/auth/domain/repo/auth_repo.dart';

class SignInWithEmailUseCase {
  SignInWithEmailUseCase(this.repository);

  final AuthRepository repository;

  FutureEither<CurrentUser> call({
    required String email,
    required String password,
  }) {
    if (email.isEmpty || !email.contains('@')) {
      return Future.value(const Left(ValidationFailure('Invalid email')));
    }
    if (password.length < 6) {
      return Future.value(const Left(ValidationFailure('Password too short')));
    }
    return repository.signInWithEmail(email: email, password: password);
  }
}
