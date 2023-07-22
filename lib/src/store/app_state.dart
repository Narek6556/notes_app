import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../shared_preferences/auth_prefs.dart';

part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store {
  @observable
  ThemeMode themeMode = ThemeMode.dark;

  @observable
  SystemUiOverlayStyle statusBarMode = SystemUiOverlayStyle.dark;

  @observable
  bool isLoggedIn = AuthPrefs.getUserId();

  @action
  void setThemeMode() {
    if (ThemeMode.dark == themeMode) {
      themeMode = ThemeMode.light;
      statusBarMode = SystemUiOverlayStyle.light;
    } else {
      themeMode = ThemeMode.dark;
      statusBarMode = SystemUiOverlayStyle.dark;
    }
  }
}
