import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:ecommerse/features/profile/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> updateProfileData();

  Future<Either<Failure, void>> userGuest();

  Future<Either<Failure, ProfileModel>> getProfileData();
}

//------------------ Implementation ------------------

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remote;
  ProfileRepoImpl({required this.remote});

  @override
  Future<Either<Failure, ProfileModel>> updateProfileData() {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> userGuest() {
    // TODO: implement userGuest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      log("enter to repo of profile");
      final user = await remote.getProfileData();
      log("user data is $user in repo");
      return right(user);

    } on ServerException catch (e) {
      throw left(ServerFailure(e.toString()));
    } catch (e) {
      throw left(UnKnownFailure(e.toString()));
    }
  }
}
