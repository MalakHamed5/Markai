import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;

  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  String? getDataString(String key) {
    return sharedPref.getString(key);
  }

  Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPref.setString(key, value);
    } else if (value is int) {
      return await sharedPref.setInt(key, value);
    } else if (value is bool) {
      return await sharedPref.setBool(key, value);
    } else {
      return await sharedPref.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return sharedPref.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPref.remove(key);
  }

  Future<bool> continsKey({required String key}) async {
    return await sharedPref.containsKey(key);
  }

  Future<bool> clearData() async {
    return await sharedPref.clear();
  }
}
