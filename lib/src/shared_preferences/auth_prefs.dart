import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../auth/models/user_model.dart';

enum StoreKeys {
  users,
  token,
}

class AuthPrefs {
  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void addUser(UserModel user) async {
    List<String>? users = _prefs.getStringList(StoreKeys.users.toString());

    if (users == null) {
      List<String> newList = [];
      newList.add(jsonEncode(user.toJson()));
      _prefs.setStringList(StoreKeys.users.toString(), newList);
    } else {
      users.add(jsonEncode(user.toJson()));
      _prefs.setStringList(StoreKeys.users.toString(), users);
    }
  }

  static List<String> getUsersUsername() {
    List<String>? users = _prefs.getStringList(StoreKeys.users.toString());
    List<String> usernames = [];

    if (users != null) {
      for (String userString in users) {
        UserModel user = UserModel.fromJson(jsonDecode(userString));
        usernames.add(user.userName);
      }
    }

    return usernames;
  }

  static UserModel? loginUser(Map<String, String> userData) {
    List<String>? users = _prefs.getStringList(StoreKeys.users.toString());

    if (users != null) {
      for (String userString in users) {
        UserModel user = UserModel.fromJson(jsonDecode(userString));
        if (user.userName == userData['username'] &&
            user.password == userData['password']) return user;
      }
    }

    return null;
  }

  static addUserId(String id) {
    _prefs.setString(StoreKeys.token.toString(), id);
  }

  static bool getUserId() {
    String? id = _prefs.getString(StoreKeys.token.toString());
    return id != null;
  }

  static removeUserId(String id) {
    _prefs.remove(StoreKeys.token.toString());
  }

  static cleanAuth() {
    _prefs.clear();
  }
}
