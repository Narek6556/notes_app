// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on AppStateBase, Store {
  late final _$isDarkAtom = Atom(name: 'AppStateBase.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$statusBarModeAtom =
      Atom(name: 'AppStateBase.statusBarMode', context: context);

  @override
  SystemUiOverlayStyle get statusBarMode {
    _$statusBarModeAtom.reportRead();
    return super.statusBarMode;
  }

  @override
  set statusBarMode(SystemUiOverlayStyle value) {
    _$statusBarModeAtom.reportWrite(value, super.statusBarMode, () {
      super.statusBarMode = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: 'AppStateBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$AppStateBaseActionController =
      ActionController(name: 'AppStateBase', context: context);

  @override
  void setThemeMode() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.setThemeMode');
    try {
      return super.setThemeMode();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark},
statusBarMode: ${statusBarMode},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
