import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:ecommerse/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/urls.dart';
import '../../../../core/services/service_locator.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  });
}

//------------------ Implementation ------------------

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      //api call
      final response = await api.post(Urls.signIn,
          data: {ApiKeys.email: email, ApiKeys.password: password});

      // model
      final user = UserModel.fromJson(response[ApiKeys.user]);

      // save token
      await sl<SecureTokenStore>().saveToken(response[ApiKeys.token]);

      return user;
    } on ServerException catch (e) {
      throw ServerFailure(e.toString());
    } catch (e) {
      throw UnKnownFailure(e.toString());
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(Urls.signUp, data: {
        ApiKeys.name: name,
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.phone: phone,
      });

      final user = UserModel.fromJson(response[ApiKeys.user]);

      await sl<SecureTokenStore>().saveToken(response[ApiKeys.token]);

      return user;
    } on ServerException catch (e) {
      throw ServerFailure(e.toString());
    } catch (e) {
      throw UnKnownFailure(e.toString());
    }
  }
}
