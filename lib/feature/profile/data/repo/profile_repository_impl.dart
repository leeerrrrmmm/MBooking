import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/app_exception.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/core/utils/typedefs.dart';
import 'package:mbooking/feature/profile/data/datasource/profile_remote_datasource.dart';
import 'package:mbooking/feature/profile/domain/repo/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteDataSource);

  final ProfileRemoteDataSource _remoteDataSource;

  @override
  FutureEither<void> updateDisplayName(String displayName) async {
    try {
      await _remoteDataSource.updateDisplayName(displayName);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  FutureEither<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
