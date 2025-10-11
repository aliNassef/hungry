import 'package:dartz/dartz.dart';

import 'package:hungry/core/api/errors/failure.dart';

import 'package:hungry/features/auth/data/models/login_input_model.dart';

import 'package:hungry/features/auth/data/models/login_model.dart';
import 'package:hungry/features/auth/data/models/register_input_model.dart';

import '../../../../core/api/errors/exceptions.dart';
import '../datasource/auth_remote_datasource.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource _authDatasource;

  AuthRepoImpl({required AuthRemoteDatasource authRemoteDatasource})
    : _authDatasource = authRemoteDatasource;
  @override
  Future<Either<Failure, UserModel>> login(
    LoginInputModel loginInputModel,
  ) async {
    try {
      final user = await _authDatasource.login(loginInputModel);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
    RegisterInputModel registerInputModel,
  ) async {
    try {
      final user = await _authDatasource.register(registerInputModel);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
