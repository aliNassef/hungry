import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_ponits.dart';
import '../models/register_input_model.dart';

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

    return UserModel.fromMap(response.data['data']);
  }

  @override
  Future<UserModel> register(RegisterInputModel registerInputModel) async {
    final response = await _apiService.post(
      EndPoints.register,
      data: registerInputModel.toMap(),
      isFormData: true,
    );

    return UserModel.fromMap(response.data['data']);
  }
}
