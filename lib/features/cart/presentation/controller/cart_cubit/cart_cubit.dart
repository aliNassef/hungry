import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/cart/data/models/cart_item_model.dart';

import '../../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());
  final CartRepo _cartRepo;
  void addToCart(CartItemModel cartItemModel) async {
    emit(CartAddLoading());
    final result = await _cartRepo.addToCart(cartItemModel);
    result.fold(
      (failure) => emit(CartAddError(errMessage: failure.errMessage)),
      (r) => emit(const CartAdded()),
    );
  }
}
