import 'package:dio/dio.dart';
import '../../app_constants.dart';
import '../helpers/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  String? _token;

  // call this at startup or rely on lazy load in onRequest
  Future<void> loadToken() async {
    final t = await CacheHelper().getData(AppConstants.TOKEN, secure: true);
    _token = t is String ? t : null;
  }

  void setToken(String? token) {
    _token = token;
  }

  String? getToken() => _token;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_token == null) {
      try {
        await loadToken();
      } catch (_) {
        // ignore load errors and continue without token
      }
    }

    options.headers['Accept-Language'] = 'en';
    options.headers['Content-Type'] = 'application/json';
    if (_token != null && _token!.isNotEmpty) {
      // correct header name is Authorization
      options.headers['Authorization'] = 'Bearer ${_token!}';
    }

    return handler.next(options);
  }
}
