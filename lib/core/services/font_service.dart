import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class FontService {
  static const String _fontSizeKey = 'font_size_scale';
  static const String _fontFamilyKey = 'font_family';
  static final _storage = GetStorage();

  static const Map<String, String> availableFonts = {
    'Poppins': 'Poppins',
    'Roboto': 'Roboto',
    'Lato': 'Lato',
    'Open Sans': 'Open Sans',
    'Montserrat': 'Montserrat',
  };

  static const Map<String, double> availableFontScales = {
    'Small': 0.8,
    'Normal': 1.0,
    'Large': 1.2,
    'Extra Large': 1.4,
  };

  static String get currentFontFamily =>
      _storage.read(_fontFamilyKey) ?? availableFonts['Poppins']!;
  static double get currentFontScale =>
      _storage.read(_fontSizeKey) ?? availableFontScales['Normal']!;

  static Future<void> setFontFamily(String fontFamily) async {
    await _storage.write(_fontFamilyKey, fontFamily);
  }

  static Future<void> setFontScale(double fontScale) async {
    await _storage.write(_fontSizeKey, fontScale);
  }

  static getCustomTextTheme(
    TextTheme baseTheme,
    String fontFamily,
    double fontSize,
  ) {
    TextTheme getFontTheme() {
      switch (fontFamily) {
        case 'Roboto':
          return GoogleFonts.robotoTextTheme(baseTheme);
        case 'Lato':
          return GoogleFonts.latoTextTheme(baseTheme);
        case 'Open Sans':
          return GoogleFonts.openSansTextTheme(baseTheme);
        case 'Montserrat':
          return GoogleFonts.montserratTextTheme(baseTheme);
        default:
          return GoogleFonts.poppinsTextTheme(baseTheme);
      }
    }

    return getFontTheme().copyWith(
      displayLarge: getFontTheme().displayLarge!.copyWith(
        fontSize: (baseTheme.displayLarge!.fontSize ?? 32) * fontSize,
      ),
      displayMedium: getFontTheme().displayMedium!.copyWith(
        fontSize: (baseTheme.displayMedium!.fontSize ?? 28) * fontSize,
      ),
      displaySmall: getFontTheme().displaySmall!.copyWith(
        fontSize: (baseTheme.displaySmall!.fontSize ?? 24) * fontSize,
      ),
      headlineMedium: getFontTheme().headlineMedium!.copyWith(
        fontSize: (baseTheme.headlineMedium!.fontSize ?? 20) * fontSize,
      ),
      titleLarge: getFontTheme().titleLarge!.copyWith(
        fontSize: (baseTheme.titleLarge!.fontSize ?? 18) * fontSize,
      ),
      bodyLarge: getFontTheme().bodyLarge!.copyWith(
        fontSize: (baseTheme.bodyLarge!.fontSize ?? 16) * fontSize,
      ),
      bodyMedium: getFontTheme().bodyMedium!.copyWith(
        fontSize: (baseTheme.bodyMedium!.fontSize ?? 14) * fontSize,
      ),
      labelLarge: getFontTheme().labelLarge!.copyWith(
        fontSize: (baseTheme.labelLarge!.fontSize ?? 14) * fontSize,
      ),
    );
  }
}
