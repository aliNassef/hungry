import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/error_model.dart';
import 'package:hungry/core/api/errors/exceptions.dart';

import '../models/login_input_model.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(LoginInputModel loginInputModel);
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
}
