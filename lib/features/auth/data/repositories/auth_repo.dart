import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/auth/data/datasources/auth_datasources.dart';
import 'package:injectable/injectable.dart';

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

  Future<Either<ErrorModel, void>> logout();

  Future<Either<ErrorModel, void>> userGuest();
}

//------------------ Implementation ------------------

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<Either<ErrorModel, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await dataSource.login(email: email, password: password);

      return right(user);
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
      final user = await dataSource.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(ErrorModel(message: e.toString()));
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, void>> logout() async {
    try {
      await dataSource.logout();
      return right(null);
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, void>> userGuest() async {
    try {
      await dataSource.userGuest();
      return right(null);
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }
}
