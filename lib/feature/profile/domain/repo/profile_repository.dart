import 'package:mbooking/core/utils/typedefs.dart';

abstract class ProfileRepository {
  FutureEither<void> updateDisplayName(String displayName);

  FutureEither<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
