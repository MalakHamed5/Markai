import 'package:dio/dio.dart';
import 'package:ecommerse/core/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});

}

void handleDioException(DioException e) {
  switch (e.type) {
    // NOT arrive to server
    case DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.badCertificate ||
          DioExceptionType.cancel ||
          DioExceptionType.connectionError ||
          DioExceptionType.unknown:
      throw ServerException(errorModel: e.response!.data);

    // arrive to server & get status code
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(errorModel: e.response!.data);
        case 401:
          throw ServerException(errorModel: e.response!.data);
        case 403:
          throw ServerException(errorModel: e.response!.data);
        case 404:
          throw ServerException(errorModel: e.response!.data);
        case 500:
          throw ServerException(errorModel: e.response!.data);
      }
  }
}
