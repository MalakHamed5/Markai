import 'package:ecommerse/core/api/urls.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});

  factory SignUpModel.formJson(Map<String, dynamic> json) {
    return SignUpModel(message: json[ApiKeys.message]);
  }
}
