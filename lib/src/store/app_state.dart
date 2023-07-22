import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../shared_preferences/auth_prefs.dart';

part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store {
  @observable
  bool isDark = AuthPrefs.getThemeMode();

  @observable
  SystemUiOverlayStyle statusBarMode = SystemUiOverlayStyle.light;

  @observable
  bool isLoggedIn = AuthPrefs.getUserId();

  @action
  void setThemeMode() {
    if (isDark) {
      isDark = false;
      statusBarMode = SystemUiOverlayStyle.dark;
    } else {
      isDark = true;
      statusBarMode = SystemUiOverlayStyle.light;
    }
  }
}
