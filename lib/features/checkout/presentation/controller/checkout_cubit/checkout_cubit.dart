import 'package:bloc/bloc.dart';
import '../../../data/model/checkout_input_model.dart';
import '../../../data/repo/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo _checkoutRepo;

  void addOrder(CheckoutInputModel order) async {
    emit(CheckoutLoading());
    final falureOrOrder = await _checkoutRepo.addOrder(order);
    falureOrOrder.fold(
      (failure) => emit(CheckoutFailure(errMessage: failure.errMessage)),
      (success) => emit(CheckoutLoaded()),
    );
  }
}
