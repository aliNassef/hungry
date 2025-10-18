import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';
import 'package:hungry/features/orders_history/data/datasource/order_history_remote_datasource.dart';
import 'package:hungry/features/orders_history/data/models/order_history_model.dart';
import 'package:hungry/features/orders_history/data/repo/order_history_repo.dart';

import '../../../../core/api/errors/exceptions.dart';

class OrderHistoryRepoImpl extends OrderHistoryRepo {
  final OrderHistoryRemoteDatasource _remoteDatasource;

  OrderHistoryRepoImpl({required OrderHistoryRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;
  @override
  Future<Either<Failure, List<OrderHistoryModel>>> getOrderHistory() async {
    try {
      final orders = await _remoteDatasource.getOrderHistory();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
