import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/enums/user_enums.dart';
import '../datasources/auth_local_datasources.dart';
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
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remote.login(email: email, password: password);

      await local.saveUserType(userType: UserTypeEnum.authenticated.name);

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
      final user = await remote.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
      );

      await local.saveUserType(userType: UserTypeEnum.authenticated.name);

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
      await local.logout();
      await local.saveUserType(userType: UserTypeEnum.unAuthenticated.name);
      return right(null);
    } catch (e) {
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> userGuest() async {
    try {
      await local.userGuest();
      await local.saveUserType(userType: UserTypeEnum.guest.name);
      return right(null);
    } catch (e) {
      print("error in userGuest: $e");
      return left(UnKnownFailure(e.toString()));
    }
  }
}
