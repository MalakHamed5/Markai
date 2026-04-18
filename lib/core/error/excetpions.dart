import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/failure.dart';

class ServerException implements Exception {
  final Failure failure;
  ServerException(this.failure);
}

void handleDioException(DioException e) {
  final errorData = e.response?.data;
  final code = e.response?.statusCode;
  String message = 'error';

  if (errorData is Map<String, dynamic>) {
    message = errorData[ApiKeys.message] ?? message;
  }

  switch (e.type) {
    // NOT arrive to server
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
      throw ServerException(NetworkFailure('No Internet Connection'));

    // arrive to server & get status code
    case DioExceptionType.badResponse:
      throw ServerException(ServerFailure(message, statusCode: code));

    default:
      throw ServerException(UnKnownFailure(message));
  }
}
