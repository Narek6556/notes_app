import 'dart:ui';

enum ColorNames {
  primary,
  secondary,
  error,
  background,
  success,
  foreground,
  primaryVariant,
}

class ColorUtils {
  static Color hexToColor(String hexColor) {
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color rgbToColor(int r, int g, int b, double opacity) {
    return Color.fromRGBO(r, g, b, opacity);
  }

  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16)}';
  }
}

class AppColors {
  static final Map<ColorNames, Color> lightColors = {
    ColorNames.primary: ColorUtils.hexToColor('#4a55a7'),
    ColorNames.secondary: ColorUtils.hexToColor('#BFDBFE'),
    ColorNames.error: ColorUtils.hexToColor('#E12E0D'),
    ColorNames.success: ColorUtils.hexToColor('#00B37E'),
    ColorNames.background: ColorUtils.hexToColor('#f9f9f9'),
    ColorNames.foreground: ColorUtils.hexToColor('#262931'),
    ColorNames.primaryVariant: ColorUtils.rgbToColor(26, 92, 255, 1),
  };

  static final Map<ColorNames, Color> darkColors = {
    ColorNames.primary: ColorUtils.hexToColor('#6371DE'),
    ColorNames.secondary: ColorUtils.hexToColor('#1E293B'),
    ColorNames.error: ColorUtils.hexToColor('#E12E0D'),
    ColorNames.success: ColorUtils.hexToColor('#00B37E'),
    ColorNames.background: ColorUtils.hexToColor('#181818'),
    ColorNames.foreground: ColorUtils.hexToColor('#FFFFFF'),
    ColorNames.primaryVariant: ColorUtils.rgbToColor(26, 92, 255, 1),
  };
}
