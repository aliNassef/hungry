import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/profile/data/repo/profile_repo.dart';

import '../../../data/models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  void getProfileData() async {
    emit(ProfileLoading());
    final result = await _profileRepo.getProfileData();
    result.fold(
      (l) => emit(ProfileFailure(errMessage: l.toString())),
      (r) => emit(ProfileLoaded(profile: r)),
    );
  }

  void logout() async {
    emit(ProfileLogoutLoading());
    final result = await _profileRepo.logout();
    result.fold(
      (l) => emit(ProfileLogoutFailure()),
      (r) => emit(ProfileLogoutSuccess()),
    );
  }
}
