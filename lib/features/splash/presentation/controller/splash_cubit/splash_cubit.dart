import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/data/repo/auth_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authRepo) : super(SplashInitial());
  final AuthRepo _authRepo;

  void checkAuth() async {
    final isLoggedIn = await _authRepo.isLoggedIn();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
