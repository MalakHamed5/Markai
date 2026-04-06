import 'package:ecommerse/core/api/urls.dart';

class SigninModel {
  final String token;
  final String message;

  SigninModel({required this.token, required this.message});

  factory SigninModel.formJson(Map<String, dynamic> json) {
    return SigninModel(
      token: json[ApiKeys.token],
      message: json[ApiKeys.message],
    );
  }
}
