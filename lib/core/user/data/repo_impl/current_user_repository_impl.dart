import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/core/user/data/datasource/current_user_remote_datasource.dart';
import 'package:mbooking/core/user/domain/entity/current_user.dart';
import 'package:mbooking/core/user/domain/repo/current_user_repository.dart';
import 'package:mbooking/core/utils/typedefs.dart';

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  CurrentUserRepositoryImpl(this._remoteDataSource);

  final CurrentUserRemoteDataSource _remoteDataSource;

  @override
  Stream<CurrentUser?> watchCurrentUser() {
    return _remoteDataSource.watchCurrentUser();
  }

  @override
  FutureEither<CurrentUser?> getCurrentUser() async {
    try {
      final user = await _remoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
