import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/error_model.dart';
import 'package:hungry/core/api/errors/exceptions.dart';
import 'package:hungry/features/auth/data/models/register_input_model.dart';

import '../models/login_input_model.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(LoginInputModel loginInputModel);
  Future<UserModel> register(RegisterInputModel loginInputModel);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService _apiService;

  AuthRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<UserModel> login(LoginInputModel loginInputModel) async {
    final response = await _apiService.post(
      EndPoints.login,
      data: loginInputModel.toMap(),
    );

    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }

    return UserModel.fromMap(response.data['data']);
  }

  @override
  Future<UserModel> register(RegisterInputModel registerInputModel) async {
    final response = await _apiService.post(
      EndPoints.register,
      data: registerInputModel.toMap(),
      isFormData: true,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }

    return UserModel.fromMap(response.data['data']);
  }
}
