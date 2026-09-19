part of 'current_user_cubit.dart';

sealed class CurrentUserState extends Equatable {
  const CurrentUserState();

  CurrentUser? get user => null;

  bool get isResolved => this is CurrentUserReady;

  bool get isLoggedIn => user != null;

  @override
  List<Object?> get props => [];
}

class CurrentUserInitial extends CurrentUserState {
  const CurrentUserInitial();
}

class CurrentUserReady extends CurrentUserState {
  const CurrentUserReady(this.user);

  @override
  final CurrentUser? user;

  @override
  List<Object?> get props => [user];
}
