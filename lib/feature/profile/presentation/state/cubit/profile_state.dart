part of 'profile_cubit.dart';

enum ProfileStatus { idle, updatingName, changingPassword, success, error }

class ProfileState extends Equatable {
  const ProfileState({this.status = ProfileStatus.idle, this.message});

  final ProfileStatus status;
  final String? message;

  bool get isUpdatingName => status == ProfileStatus.updatingName;
  bool get isChangingPassword => status == ProfileStatus.changingPassword;
  bool get isBusy => isUpdatingName || isChangingPassword;

  ProfileState copyWith({ProfileStatus? status, String? message}) {
    return ProfileState(status: status ?? this.status, message: message);
  }

  @override
  List<Object?> get props => [status, message];
}
