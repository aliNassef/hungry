import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

class CustomException implements Exception {
  final String errorMessage;

  CustomException(this.errorMessage);
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(
        ErrorModel.fromJson(
          {"message": "Please check your internet connection"} as Map,
        ),
      );
    case DioExceptionType.unknown:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          try {
            throw ServerException(ErrorModel.fromJson(e.response!.data));
          } catch (error) {
            throw ServerException(
              ErrorModel(
                errorMessage: 'Resource not found: ${e.requestOptions.path}',
              ),
            );
          }

        case 409: //cofficient
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerException(ErrorModel.fromJson(e.response!.data));
      }
  }
}
