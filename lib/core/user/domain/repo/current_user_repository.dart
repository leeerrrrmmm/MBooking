import 'package:mbooking/core/user/domain/entity/current_user.dart';
import 'package:mbooking/core/utils/typedefs.dart';

abstract class CurrentUserRepository {
  Stream<CurrentUser?> watchCurrentUser();

  FutureEither<CurrentUser?> getCurrentUser();
}
