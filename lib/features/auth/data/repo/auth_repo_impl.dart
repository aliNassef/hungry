import 'package:dartz/dartz.dart';

import '../../../../core/api/errors/exceptions.dart';
import '../../../../core/api/errors/failure.dart';
import '../datasource/auth_local_datasource.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/login_input_model.dart';
import '../models/login_model.dart';
import '../models/register_input_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;
  final AuthLocalDatasource _authLocalDatasource;
  AuthRepoImpl({
    required AuthRemoteDatasource authRemoteDatasource,
    required AuthLocalDatasource authLocalDatasource,
  }) : _authLocalDatasource = authLocalDatasource,
       _authRemoteDatasource = authRemoteDatasource;
  @override
  Future<Either<Failure, UserModel>> login(
    LoginInputModel loginInputModel,
  ) async {
    try {
      final user = await _authRemoteDatasource.login(loginInputModel);
      await _authLocalDatasource.cacheToken(user.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
    RegisterInputModel registerInputModel,
  ) async {
    try {
      final user = await _authRemoteDatasource.register(registerInputModel);
      await _authLocalDatasource.cacheToken(user.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _authLocalDatasource.getCachedToken();
    return token != null;
  }
}
