import '../../../../core/helpers/cache_helper.dart';

abstract class ProfileLocalDatasource {
  Future<void> clearCache();
}

class ProfileLocalDatasourceImpl implements ProfileLocalDatasource {
  final CacheHelper _cacheHelper;

  ProfileLocalDatasourceImpl({required CacheHelper cacheHelper})
    : _cacheHelper = cacheHelper;
  @override
  Future<void> clearCache() async {
    await _cacheHelper.clearAll();
  }
}
