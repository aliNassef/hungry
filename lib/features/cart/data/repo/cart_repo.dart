import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';
import 'package:hungry/features/cart/data/models/order_model.dart';

import '../models/cart_item_input_model.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart(CartItemInputModel cartItemModel);
  Future<Either<Failure, OrderModel>> getCartItems();
  Future<Either<Failure, void>> removeFromCarts({required int id});
}
