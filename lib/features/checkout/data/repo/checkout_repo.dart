import 'package:dartz/dartz.dart';

import '../../../../core/api/errors/failure.dart';
import '../model/checkout_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addOrder(CheckoutInputModel order);
}