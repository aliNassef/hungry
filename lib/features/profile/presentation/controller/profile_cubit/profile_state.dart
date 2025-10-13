part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profile;

  const ProfileLoaded({required this.profile});
  @override
  List<Object> get props => [profile];
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  const ProfileFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileLogoutFailure extends ProfileState {}

final class ProfileLogoutLoading extends ProfileState {}