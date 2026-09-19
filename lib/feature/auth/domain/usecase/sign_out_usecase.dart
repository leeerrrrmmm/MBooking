import 'package:mbooking/core/utils/typedefs.dart';
import 'package:mbooking/feature/auth/domain/repo/auth_repo.dart';

class SignOutUseCase {
  final AuthRepository repository;
  SignOutUseCase(this.repository);

  FutureEither<void> call() {
    return repository.signOut();
  }
}
