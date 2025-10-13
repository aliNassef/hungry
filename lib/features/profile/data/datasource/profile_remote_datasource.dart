import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/exceptions.dart';

import '../../../../core/api/errors/error_model.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<void> logout();
  Future<ProfileModel> getProfileData();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final ApiService _apiService;

  ProfileRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<ProfileModel> getProfileData() async {
    final response = await _apiService.get(EndPoints.profile);
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    return ProfileModel.fromJson(response.data['data']);
  }

  @override
  Future<void> logout() async {
    return await _apiService.post(EndPoints.logout);
  }
}
