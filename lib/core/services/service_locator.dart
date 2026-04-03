import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await CacheHelper.init();
  sl.registerLazySingleton<CacheHelper>(CacheHelper.new);
  sl.registerLazySingleton<SecureTokenStore>(SecureTokenStore.new);
}
