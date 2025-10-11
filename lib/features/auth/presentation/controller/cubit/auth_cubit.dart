import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/auth/data/repo/auth_repo.dart';

import '../../../data/models/login_input_model.dart';
import '../../../data/models/register_input_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;

  void login(LoginInputModel loginInputModel) async {
    emit(AuthLoading());
    var failureOrUser = await _authRepo.login(loginInputModel);
    failureOrUser.fold(
      (failure) => emit(AuthFailure(errMessage: failure.errMessage)),
      (r) => emit(AuthSuccess()),
    );
  }

  void register(RegisterInputModel registerInputModel) async {
    emit(AuthLoading());
    var failureOrUser = await _authRepo.register(registerInputModel);
    failureOrUser.fold(
      (failure) => emit(AuthFailure(errMessage: failure.errMessage)),
      (r) => emit(AuthSuccess()),
    );
  }
}
