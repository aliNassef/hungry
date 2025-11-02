import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/slide_option_model.dart';
import '../../../data/models/topping_model.dart';
import '../../../data/repo/home_repo.dart';

part 'get_toppings_and_side_options_state.dart';

class GetToppingsAndSideOptionsCubit
    extends Cubit<GetToppingsAndSideOptionsState> {
  GetToppingsAndSideOptionsCubit(this._homeRepo)
    : super(GetToppingsAndSideOptionsInitial());
  final HomeRepo _homeRepo;

  Future<void> getToppings() async {
    emit(GetToppingsLoading());
    final result = await _homeRepo.getToppings();
    result.fold(
      (failure) => emit(GetToppingsError(errMessage: failure.errMessage)),
      (toppings) => emit(GetToppingsLoaded(toppings: toppings)),
    );
  }

  Future<void> getSideOptions() async {
    emit(GetSideOptionsLoading());
    final result = await _homeRepo.getSideOptions();
    result.fold(
      (failure) => emit(GetSideOptionsError(errMessage: failure.errMessage)),
      (sideOptions) => emit(GetSideOptionsLoaded(sideOptions: sideOptions)),
    );
  }
}
