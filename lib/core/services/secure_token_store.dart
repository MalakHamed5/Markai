import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStore {
  // create instance of secure storage
  static const _storage = FlutterSecureStorage();
  static const String _key = "auth_token";

  static const AndroidOptions _androidOptions = AndroidOptions(
    resetOnError: true,
  );
  static const IOSOptions _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );
  static const MacOsOptions _macOsOptions = MacOsOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );

  Future<void> save(String token) async {
    await _storage.write(
      key: _key,
      value: token,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOsOptions,
    );
  }

  static Future<String?> read() async {
    return await _storage.read(
      key: _key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOsOptions,
    );
  }

  static Future<void> delete() async {
    await _storage.delete(key: _key);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
