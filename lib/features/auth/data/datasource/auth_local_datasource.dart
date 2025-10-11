import 'package:hungry/app_constants.dart';
import 'package:hungry/core/api/errors/exceptions.dart';

import '../../../../core/helpers/cache_helper.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheToken(String token);
  Future<String?> getCachedToken();
  Future<void> clearToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final CacheHelper _cacheHelper;

  AuthLocalDatasourceImpl({required CacheHelper cacheHelper})
    : _cacheHelper = cacheHelper;

  @override
  Future<void> cacheToken(String token) async {
    try {
      await _cacheHelper.saveData(
        key: AppConstants.TOKEN,
        value: token,
        secure: true,
      );
    } catch (e) {
      throw CustomException(errorMessage: 'Failed to cache token: $e');
    }
  }

  @override
  Future<String?> getCachedToken() async {
    try {
      return await _cacheHelper.getData(AppConstants.TOKEN, secure: true) as String?;
    } catch (e) {
      throw CustomException(errorMessage: 'No cached token found: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    await _cacheHelper.removeData(AppConstants.TOKEN, secure: true);
  }
}
