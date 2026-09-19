import 'package:mbooking/core/user/domain/entity/current_user.dart';
import 'package:mbooking/core/utils/typedefs.dart';

abstract class AuthRepository {
  FutureEither<CurrentUser> signInWithEmail({
    required String email,
    required String password,
  });

  FutureEither<CurrentUser> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  });

  FutureEither<void> signOut();
}
