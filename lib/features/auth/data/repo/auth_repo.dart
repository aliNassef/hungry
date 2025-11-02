import 'package:dartz/dartz.dart';

import '../../../../core/api/errors/failure.dart';
import '../models/login_input_model.dart';
import '../models/login_model.dart';
import '../models/register_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(LoginInputModel loginInputModel);
  Future<Either<Failure, UserModel>> register(
    RegisterInputModel registerInputModel,
  );
  Future<bool> isLoggedIn();
}
