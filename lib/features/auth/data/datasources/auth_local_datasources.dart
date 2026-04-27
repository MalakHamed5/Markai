import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/core/shared/enums/user_enums.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/services/secure_token_store.dart';
import '../../../../core/services/service_locator.dart';

abstract interface class AuthLocalDataSource {
  Future<void> userGuest();
  Future<void> logout();
  Future<void> saveUserType({required String userType});
  Future<String?> getUserType();
}

//------------------ implementation ------------------

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> logout() async {
    try {
      await sl<SecureTokenStore>().deleteToken();
    } catch (e) {
      throw UnKnownFailure(e.toString());
    }
  }

  @override
  Future<void> userGuest() async {
    try {
      await sl<CacheHelper>()
          .saveData(key: 'is_guest', value: UserTypeEnum.guest.name);
    } catch (e) {
      throw UnKnownFailure(e.toString());
    }
  }

  Future<void> saveUserType({required String userType}) async {
    await sl<CacheHelper>().saveData(key: 'user_type', value: userType);
  }

  Future<String?> getUserType() async {
    return await sl<CacheHelper>().getData(key: 'user_type');
  }
}
