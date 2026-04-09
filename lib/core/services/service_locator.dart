import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service_locator.config.dart';

// global get it
final sl = GetIt.instance;

@InjectableInit()
void setupServiceLocator() => sl.init();

@module
abstract class AppServices {
  @LazySingleton()
  Dio get dio => Dio();

  @preResolve
  @LazySingleton()
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @LazySingleton()
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
