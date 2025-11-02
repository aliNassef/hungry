import 'package:dartz/dartz.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../../../core/api/errors/failure.dart';
import '../datasource/cart_remote_datasource.dart';
import '../models/cart_item_input_model.dart';
import '../models/order_model.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource _dataSource;

  CartRepoImpl({required CartRemoteDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<Either<Failure, void>> addToCart(
    CartItemInputModel cartItemModel,
  ) async {
    try {
      final result = await _dataSource.addToCart(cartItemModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getCartItems() async {
    try {
      final carts = await _dataSource.getCartItems();
      return Right(carts);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCarts({required int id}) async {
    try {
      await _dataSource.removeFromCart(id: id);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
