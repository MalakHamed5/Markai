import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/dio_consumer.dart';
import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repo.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await CacheHelper.init();

  // Atorage & Cache
  sl.registerLazySingleton<CacheHelper>(()=> CacheHelper());
  sl.registerLazySingleton<SecureTokenStore>(()=> SecureTokenStore());

  // Api
  sl.registerLazySingleton<Dio>(()=> Dio());
  sl.registerLazySingleton<DioConsumer>(()=> DioConsumer(dio: sl<Dio>()));

  // Repos
  sl.registerLazySingleton<AuthRepoImpl>(()=> AuthRepoImpl(api: sl<DioConsumer>()));
}
