import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/orders_history/data/datasource/order_history_remote_datasource.dart';
import '../../features/orders_history/data/repo/order_history_repo.dart';
import '../../features/orders_history/data/repo/order_history_repo_impl.dart';
import '../../features/orders_history/presentation/controller/get_order_history_cubit/get_orders_history_cubit.dart';
import '../api/api_service.dart';
import '../api/dio_helper.dart';
import '../../features/auth/data/datasource/auth_local_datasource.dart';
import '../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/controller/cubit/auth_cubit.dart';
import '../../features/cart/data/datasource/cart_remote_datasource.dart';
import '../../features/splash/presentation/controller/splash_cubit/splash_cubit.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import '../../features/home/data/datasource/home_remote_datasource.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/controller/get_categories_cubit/get_categories_cubit.dart';
import '../../features/home/presentation/controller/get_products_cubit/get_products_cubit.dart';
import '../../features/home/presentation/controller/get_toppings_and_side_optionscubit/get_toppings_and_side_options_cubit.dart';
import '../../features/profile/data/datasource/profile_local_datasource.dart';
import '../../features/profile/data/datasource/profile_remote_datasource.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/presentation/controller/profile_cubit/profile_cubit.dart';
import '../helpers/cache_helper.dart';

final injector = GetIt.instance;

void setupServiceLocator() async {
  _setupExternal();
  _authFeature();
  _homeFeature();
  _setupCartFeature();
  _profileFeature();
  _ordersHistoryFeature();
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

void _homeFeature() {
  injector.registerFactory(() => GetCategoriesCubit(injector.get<HomeRepo>()));
  injector.registerFactory(() => GetProductsCubit(injector.get<HomeRepo>()));
  injector.registerFactory(
    () => GetToppingsAndSideOptionsCubit(injector.get<HomeRepo>()),
  );
  injector.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(datasource: injector.get<HomeRemoteDatasource>()),
  );
  injector.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(apiService: injector.get<ApiService>()),
  );
}

void _setupCartFeature() {
  injector.registerFactory(() => CartCubit(injector.get<CartRepo>()));
  injector.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(dataSource: injector.get<CartRemoteDataSource>()),
  );
  injector.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiService: injector.get<ApiService>()),
  );
}

void _profileFeature() {
  injector.registerFactory(() => ProfileCubit(injector.get<ProfileRepo>()));
  injector.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      localDatasource: injector.get<ProfileLocalDatasource>(),
      remoteDatasource: injector.get<ProfileRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<ProfileLocalDatasource>(
    () => ProfileLocalDatasourceImpl(cacheHelper: injector.get<CacheHelper>()),
  );
  injector.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(apiService: injector.get<ApiService>()),
  );
}

void _ordersHistoryFeature() {
  injector.registerFactory(
    () => GetOrdersHistoryCubit(injector.get<OrderHistoryRepo>()),
  );
  injector.registerLazySingleton<OrderHistoryRepo>(
    () => OrderHistoryRepoImpl(
      remoteDatasource: injector.get<OrderHistoryRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<OrderHistoryRemoteDatasource>(
    () => OrderHistoryRemoteDatasourceImpl(
      apiService: injector.get<ApiService>(),
    ),
  );
}
