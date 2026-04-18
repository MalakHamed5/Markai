import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/auth/data/datasources/auth_datasources.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> userGuest();
}

//------------------ Implementation ------------------

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await dataSource.login(email: email, password: password);

      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
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
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return right(null);
    } catch (e) {
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> userGuest() async {
    try {
      await dataSource.userGuest();
      return right(null);
    } catch (e) {
      return left(UnKnownFailure(e.toString()));
    }
  }
}
