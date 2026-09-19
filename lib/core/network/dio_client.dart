import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mbooking/core/error/app_exception.dart';

Dio createDio({required String apiKey}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {'api_key': apiKey},
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(requestBody: false, responseBody: false),
    );
  }

  return dio;
}

AppException mapDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
    case DioExceptionType.connectionError:
      return const NetworkException();
    case DioExceptionType.badResponse:
      return ServerException(
        error.response?.statusMessage ?? 'Server error',
        error.response?.statusCode,
      );
    case DioExceptionType.cancel:
      return const NetworkException('Request cancelled');
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return ServerException(error.message ?? 'Request failed');
  }
}
