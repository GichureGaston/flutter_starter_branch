import 'package:flutter/foundation.dart';
import 'package:mocka/data/data_providers/secure_storage.dart';

class AuthRepository {
  final SecureStorage _secureStorage;

  AuthRepository({required SecureStorage secureStorage})
    : _secureStorage = secureStorage;

  Future<void> persistPassword(String password) async {
    if (kDebugMode) {
      print('DEBUG: Persisting password: $password');
    }
    await _secureStorage.persistPassword(password);
  }

  Future<bool> validateLocalPassword(String inputPassword) async {
    String? storedPassword = await _secureStorage.readPassword();
    if (kDebugMode) {
      print('DEBUG: Stored password: $storedPassword');
      print('DEBUG: Input password: $inputPassword');
    }
    return storedPassword == inputPassword;
  }

  Future<bool> get hasPassword async {
    final password = await _secureStorage.readPassword();
    return password != null;
  }

  Future<void> deletePassword() async {
    if (kDebugMode) {
      print('DEBUG: Deleting password');
    }
    await _secureStorage.deletePassword();
  }
}
