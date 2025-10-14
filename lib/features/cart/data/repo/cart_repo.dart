import 'package:dartz/dartz.dart';
import '../../../../core/api/errors/failure.dart';

import '../models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<Failure , void>> addToCart(CartItemModel cartItemModel);
}