import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/urls.dart';
import '../../../../core/error/excetpions.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileData();
}

//---------------- implementation

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer api;
  ProfileRemoteDataSourceImpl({required this.api});
  @override
  Future<ProfileModel> getProfileData() async {
    try {
      final response = await api.get(Urls.getUserData);

      log("user data is $response in datasource");
      log('-----------------------------'); 
      final user = ProfileModel.fromJson(response[ApiKeys.message]);

      return user;
    } on ServerException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
