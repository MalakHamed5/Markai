import 'package:ecommerse/core/api/urls.dart';

class ErrorModel {
  final String message;
  final int? statusCode;

  ErrorModel({required this.message, this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json[ApiKeys.message] ?? 'error message',
      statusCode: json[ApiKeys.statusCode] ?? 0,
    );
  }
}
