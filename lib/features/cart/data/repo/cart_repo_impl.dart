import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/exceptions.dart';
import 'package:hungry/core/api/errors/failure.dart';
import 'package:hungry/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:hungry/features/cart/data/models/cart_item_model.dart';
import 'package:hungry/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource _dataSource;

  CartRepoImpl({required CartRemoteDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<Either<Failure, void>> addToCart(CartItemModel cartItemModel) async {
    try {
      final result = await _dataSource.addToCart(cartItemModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
