import 'package:ecommerse/core/api/urls.dart';

class SigninModel {
  final String token;
  final String massage;

  SigninModel({required this.token, required this.massage});

  factory SigninModel.formJson(Map<String, dynamic> json) {
    return SigninModel(
      token: json[ApiKeys.token],
      massage: json[ApiKeys.message],
    );
  }
}
