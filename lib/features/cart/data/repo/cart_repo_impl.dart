import 'package:dartz/dartz.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../../../core/api/errors/failure.dart';
import '../datasource/cart_remote_datasource.dart';
import '../models/cart_item_model.dart';
import 'cart_repo.dart';

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
