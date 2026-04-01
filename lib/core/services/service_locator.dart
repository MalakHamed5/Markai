import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // database
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper.init());
  sl.registerLazySingleton<SecureTokenStore>(() => SecureTokenStore());
}
