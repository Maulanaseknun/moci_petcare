import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/src/constants/keys/hive_key.dart';
import '/src/features/authentication/domain/user.dart';
import '../../utils/extension/string_extension.dart';

class HiveService {
  final hiveUser = Hive.box<String>(HiveKey.userBox);
  final hiveUserToken = Hive.box<String>(HiveKey.userTokenBox);
  final firstInstall = Hive.box<String>(HiveKey.firstInstallBox);


  /// Get Current User
  User? getCurrentUser() {
    // TODO : revisit, update, and testing in any cases
    // check if hiveJson is empty then just return null
    try {
      final hiveJson = hiveUser.get(HiveKey.user);
      if (hiveJson.isNullOrEmpty) return null;

      final userJson = json.decode(hiveJson!);
      return User.fromJson(userJson);
    } catch (error, st) {
      log(error.toString(), error: error, stackTrace: st);
      return null;
    }
  }

  bool isFirstInstall() {
    final hiveBool = firstInstall.get(HiveKey.firstInstall);
    return hiveBool != null ? false : true;
  }

  /// Set first install
  void setNotFirstInstall() {
    firstInstall.put(HiveKey.firstInstall, 'false');
  }

  /// Set Current User
  void saveCurrentUser(User user) {
    final hiveJson = user.toJson();
    final userJson = json.encode(hiveJson);
    hiveUser.put(HiveKey.user, userJson);
  }

  /// Delete Current User
  void deleteCurrentUser() => hiveUser.delete(HiveKey.user);

  /// Get Current User
  String? getUserToken() => hiveUserToken.get(HiveKey.userToken);

  /// Set User Token
  void saveUserToken(String token) =>
      hiveUserToken.put(HiveKey.userToken, token);

  /// Delete User Token
  void deleteUserToken() => hiveUserToken.delete(HiveKey.userToken);

  /// Set User Credential


  /// Set logout
  void logout() {
    deleteCurrentUser();
    // deleteUserToken();
    // deleteOtherHive();
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
