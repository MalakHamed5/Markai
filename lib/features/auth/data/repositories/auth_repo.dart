import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ErrorModel, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ErrorModel, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  });

  Future<void> logout();

  Future<Either<ErrorModel, void>> userGuest();
}

//------------------ Implementation ------------------

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      // api call
      final response = await api.post(Urls.signIn,
          data: {ApiKeys.email: email, ApiKeys.password: password});

      // modeling response
      final UserModel? user = UserModel.fromJson(response[ApiKeys.user]);

      if (user != null) {
        // save token
        await sl<SecureTokenStore>().saveToken(response[ApiKeys.token]);
      }
      return right(user!);
    } on ServerException catch (e) {
      return left(ErrorModel(message: e.toString()));
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  }) async {
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
      final user = UserModel.fromJson(response[ApiKeys.user]);

      await sl<SecureTokenStore>().saveToken(response[ApiKeys.token]);

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
  Future<Either<ErrorModel, void>> userGuest() async {
    try {
      await sl<CacheHelper>().saveData(key: 'is_guest', value: true);
      return right(null);
    } catch (e) {
      throw left(ErrorModel(message: e.toString()));
    }
  }
}
