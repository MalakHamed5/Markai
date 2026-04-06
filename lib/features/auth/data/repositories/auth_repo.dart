import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/core/error/excetpions.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ErrorModel, UserModel>> login(String email, String password);

  Future<Either<ErrorModel, UserModel>> register(String name, String email,
      String password, String phone, String confirmPassword);

  Future<void> logout();

  Future<Either<ErrorModel, UserModel>> getProfileData();

  Future<Either<ErrorModel, UserModel>> updateProfileData();
}

//------------------ Implementation ------------------

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, UserModel>> login(
      String email, String password) async {
    try {
      // api call
      final response = await api.post(Urls.signIn,
          data: {ApiKeys.email: email, ApiKeys.password: password});

      // modeling response
      final UserModel? user = UserModel.fromJson(response[ApiKeys.message]);

      if (user != null) {
        // save user
        await sl<CacheHelper>().saveData(key: ApiKeys.token, value: user);
      }
      return right(user!);
    } on ServerException catch (e) {
      throw left(ErrorModel(message: e.toString()));
    } catch (e) {
      throw left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, UserModel>> register(String name, String email,
      String password, String phone, confirmPassword) async {
    try {
      // api call
      final response = await api.post(Urls.signUp, data: {
        ApiKeys.name: name,
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.phone: phone,
      });

      // modeling
      final user = UserModel.fromJson(response[ApiKeys.message]);

      return right(user);
    } on ServerException catch (e) {
      throw left(ErrorModel(message: e.toString()));
    } catch (e) {
      throw left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, UserModel>> getProfileData() async {
    try {
      final response = await api.get(Urls.getUserData);

      final user = UserModel.fromJson(response[ApiKeys.message]);

      return right(user);
    } on ServerException catch (e) {
      throw left(ErrorModel(message: e.toString()));
    } catch (e) {
      throw left(e.toString());
    }
  }

  @override
  Future<Either<ErrorModel, UserModel>> updateProfileData() {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }
}
