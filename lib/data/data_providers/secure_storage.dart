import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  static const _keyPassword = 'user_password';

  Future<void> persistPassword(String password) async {
    await _storage.write(key: _keyPassword, value: password);
  }

  Future<String?> readPassword() async {
    return await _storage.read(key: _keyPassword);
  }

  Future<void> deletePassword() async {
    await _storage.delete(key: _keyPassword);
  }
}
