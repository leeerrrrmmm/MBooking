import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/core/user/domain/entity/current_user.dart';
import 'package:mbooking/core/user/domain/repo/current_user_repository.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit(this._repository) : super(const CurrentUserInitial()) {
    _subscription = _repository.watchCurrentUser().listen(
      (user) => emit(CurrentUserReady(user)),
      onError: (_) {
        if (state is CurrentUserReady) return;
        emit(const CurrentUserReady(null));
      },
    );
  }

  final CurrentUserRepository _repository;
  StreamSubscription<CurrentUser?>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
