import 'package:dartz/dartz.dart';
import 'package:hungry/features/checkout/data/repo/checkout_repo.dart';

import '../../../../core/api/errors/exceptions.dart';
import '../../../../core/api/errors/failure.dart';
import '../datasource/checkout_remote_datasource.dart';
import '../model/checkout_input_model.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutRemoteDatasource _remoteDatasource;

  CheckoutRepoImpl({required CheckoutRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;
  @override
  Future<Either<Failure, void>> addOrder(CheckoutInputModel order) async {
    try {
      await _remoteDatasource.addOrder(order);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
