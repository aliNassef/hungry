import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../../../core/api/errors/failure.dart';
import '../datasource/profile_local_datasource.dart';
import '../datasource/profile_remote_datasource.dart';

import '../models/profile_model.dart';

import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDatasource _remoteDatasource;
  final ProfileLocalDatasource _localDatasource;
  ProfileRepoImpl({
    required ProfileRemoteDatasource remoteDatasource,
    required ProfileLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource,
       _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      final profile = await _remoteDatasource.getProfileData();
      return Right(profile);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await _remoteDatasource.logout();
      await _localDatasource.clearCache();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfileData({
    required ProfileModel profile,
  }) async {
    try {
      await _remoteDatasource.updateProfileData(profile);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on DioException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
