import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry/core/api/api_service.dart';
import 'package:hungry/core/api/dio_helper.dart';
import 'package:hungry/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:hungry/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:hungry/features/auth/data/repo/auth_repo.dart';
import 'package:hungry/features/auth/data/repo/auth_repo_impl.dart';
import 'package:hungry/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:hungry/features/splash/presentation/controller/splash_cubit/splash_cubit.dart';

import '../helpers/cache_helper.dart';

final injector = GetIt.instance;

void setupServiceLocator() async {
  _setupExternal();
  _authFeature();
}

void _setupExternal() {
  injector.registerLazySingleton<CacheHelper>(() => CacheHelper());
  injector.registerLazySingleton<ApiService>(() => DioHelper(dio: Dio()));
}

void _authFeature() {
  injector.registerFactory(() => AuthCubit(injector.get<AuthRepo>()));
  injector.registerFactory(() => SplashCubit(injector.get<AuthRepo>()));
  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authLocalDatasource: injector.get<AuthLocalDatasource>(),
      authRemoteDatasource: injector.get<AuthRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(apiService: injector.get<ApiService>()),
  );
  injector.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(cacheHelper: injector.get<CacheHelper>()),
  );
}

