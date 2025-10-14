import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/end_ponits.dart';
import 'package:hungry/core/api/errors/exceptions.dart';

import '../../../../core/api/errors/error_model.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<void> logout();
  Future<ProfileModel> getProfileData();
  Future<void> updateProfileData(ProfileModel profile);
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

  @override
  Future<void> updateProfileData(ProfileModel profile) async {
    final response = await _apiService.post(
      EndPoints.updateProfile,
      data: profile.toJson(),
      isFormData: true,
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
    return;
  }
}
