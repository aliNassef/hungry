import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_interceptors.dart';
import 'api_service.dart';
import 'end_ponits.dart';
import 'errors/exceptions.dart';

class DioHelper extends ApiService {
  final Dio dio;
  DioHelper({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.sendTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future postDataWithImage(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    dio.options.headers = {
      "accept": "*/*",
      "Content-Type": "multipart/form-data",
    };
    try {
      if (data is Map<String, dynamic> &&
          (data.containsKey('files') || data.containsKey('Image'))) {
        final formData = FormData();

        String fileFieldName = data.containsKey('files') ? 'files' : 'Image';
        final files = data[fileFieldName] as List;

        for (var file in files) {
          if (file is File) {
            formData.files.add(
              MapEntry(
                fileFieldName,
                await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                ),
              ),
            );
          } else if (file is MultipartFile) {
            formData.files.add(MapEntry(fileFieldName, file));
          }
        }
        data.forEach((key, value) {
          if (key != 'files' && value != null) {
            formData.fields.add(MapEntry(key, value.toString()));
          }
        });

        final response = await dio.post(
          path,
          data: formData,
          queryParameters: queryParameters,
        );
        return response;
      } else {
        final response = await dio.post(
          path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        );
        return response;
      }
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
