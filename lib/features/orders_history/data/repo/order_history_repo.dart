import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';

import '../models/order_history_model.dart';

abstract class OrderHistoryRepo {
  Future<Either<Failure, List<OrderHistoryModel>>> getOrderHistory();
}
