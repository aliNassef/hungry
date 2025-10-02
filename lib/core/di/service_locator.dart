import 'package:get_it/get_it.dart';

import '../helpers/cache_helper.dart';

final injector = GetIt.instance;

void setupServiceLocator() async {
  _setupExternal();
}

void _setupExternal() {
  injector.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
