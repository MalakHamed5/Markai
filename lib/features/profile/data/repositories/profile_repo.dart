import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/urls.dart';

abstract class ProfileRepo {
  Future<Either<ErrorModel, UserModel>> updateProfileData();

  Future<Either<ErrorModel, void>> userGuest();

  Future<Either<ErrorModel, UserModel>> getProfileData();
}

//------------------ Implementation ------------------

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, UserModel>> updateProfileData() {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> userGuest() {
    // TODO: implement userGuest
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
}
