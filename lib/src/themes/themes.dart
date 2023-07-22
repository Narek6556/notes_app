import 'package:flutter/material.dart';
import 'package:notes_app/src/themes/color_utils.dart';

class AppThemes {
  static ThemeData light() {
    final ThemeData lightTheme = ThemeData.light();

    return lightTheme.copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.lightColors[ColorNames.primary]!,
        onPrimary: AppColors.lightColors[ColorNames.foreground]!,
        primaryContainer: AppColors.darkColors[ColorNames.primaryVariant]!,
        secondary: AppColors.lightColors[ColorNames.secondary]!,
        onSecondary: AppColors.lightColors[ColorNames.background]!,
        error: AppColors.lightColors[ColorNames.error]!,
        onError: AppColors.lightColors[ColorNames.foreground]!,
        background: AppColors.lightColors[ColorNames.background]!,
        onBackground: AppColors.lightColors[ColorNames.foreground]!,
        surface: AppColors.lightColors[ColorNames.background]!,
        onSurface: AppColors.lightColors[ColorNames.foreground]!,
      ),
    );
  }

  static ThemeData dark() {
    final ThemeData darkTheme = ThemeData.dark();
    print(AppColors.darkColors[ColorNames.error]!);
    return darkTheme.copyWith(
      scaffoldBackgroundColor: AppColors.darkColors[ColorNames.background]!,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.darkColors[ColorNames.primary]!,
        primaryContainer: AppColors.darkColors[ColorNames.primaryVariant]!,
        onPrimary: AppColors.darkColors[ColorNames.foreground]!,
        secondary: AppColors.darkColors[ColorNames.secondary]!,
        onSecondary: AppColors.darkColors[ColorNames.background]!,
        error: AppColors.darkColors[ColorNames.error]!,
        onError: AppColors.darkColors[ColorNames.foreground]!,
        background: AppColors.darkColors[ColorNames.background]!,
        onBackground: AppColors.darkColors[ColorNames.foreground]!,
        surface: AppColors.darkColors[ColorNames.background]!,
        onSurface: AppColors.darkColors[ColorNames.foreground]!,
      ),
    );
  }
}

extension ExtendedThemeData on ColorScheme {
  Color get success => AppColors.lightColors[ColorNames.success]!;
  Color get onSuccess => AppColors.darkColors[ColorNames.foreground]!;
  Color get textButton => ThemeMode.dark == ThemeMode.system
      ? AppColors.darkColors[ColorNames.foreground]!
      : AppColors.lightColors[ColorNames.primaryVariant]!;
  Color get onButton => AppColors.darkColors[ColorNames.foreground]!;
  Color get text => AppColors.darkColors[ColorNames.background]!;
}
