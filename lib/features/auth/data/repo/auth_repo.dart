import 'package:dartz/dartz.dart';
import 'package:hungry/features/auth/data/models/login_model.dart';

import '../../../../core/api/errors/failure.dart';
import '../models/login_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(LoginInputModel loginInputModel);
}
