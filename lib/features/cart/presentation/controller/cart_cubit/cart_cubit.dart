import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/cart/data/models/cart_item_input_model.dart';

import '../../../data/models/order_model.dart';
import '../../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());
  final CartRepo _cartRepo;
  void addToCart(CartItemInputModel cartItemModel) async {
    emit(CartAddLoading());
    final result = await _cartRepo.addToCart(cartItemModel);
    result.fold(
      (failure) => emit(CartAddError(errMessage: failure.errMessage)),
      (r) => emit(const CartAdded()),
    );
  }

  void getCartItems() async {
    emit(CartLoading());
    final cartItemsOrfailure = await _cartRepo.getCartItems();
    cartItemsOrfailure.fold(
      (failure) => emit(CartError(errMessage: failure.errMessage)),
      (orderModel) => emit(CartLoaded(orderModel: orderModel)),
    );
  }

  void removeItemFromCart(int id) async {
    emit(CartRemoveLoading(
      id: id
    ));
    final removedOrfailure = await _cartRepo.removeFromCarts(id: id);
    removedOrfailure.fold(
      (failure) => emit(CartRemoveError(errMessage: failure.errMessage)),
      (done) {
        emit(CartRemoved(id: id));
      },
    );
  }
}
