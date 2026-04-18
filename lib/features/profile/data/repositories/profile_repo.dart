import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/urls.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> updateProfileData();

  Future<Either<Failure, void>> userGuest();

  Future<Either<Failure, UserModel>> getProfileData();
}

//------------------ Implementation ------------------

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

  @override
  Future<Either<Failure, UserModel>> updateProfileData() {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> userGuest() {
    // TODO: implement userGuest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
      final response = await api.get(Urls.getUserData);

      final user = UserModel.fromJson(response[ApiKeys.message]);

      return right(user);
    } on ServerException catch (e) {
      throw left(ServerFailure(e.toString()));
    } catch (e) {
      throw left(UnKnownFailure(e.toString()));
    }
  }
}
