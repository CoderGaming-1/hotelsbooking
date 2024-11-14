import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';

/// A class to help manage themes and colors within the application.
class ThemeHelper {
  // The current app theme, fetched from shared preferences or a default value.
  final String _appTheme = PrefUtils().getThemeData() ?? 'lightCode';

  /// Supported custom colors mapped by theme name.
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  /// Supported color schemes mapped by theme name.
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': MyColorSchemes.lightCodeColorScheme,
  };

  /// Get the custom colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Get the theme data for the current theme.
  ThemeData _getThemeData() {
    final colorScheme =
        _supportedColorScheme[_appTheme] ?? MyColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: _getThemeColors().whiteA700,
    );
  }

  /// Public method to get the current theme colors.
  LightCodeColors themeColor() => _getThemeColors();

  /// Public method to get the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Utility class to define text themes based on a color scheme.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodySmall: TextStyle(
          color: appTheme.blueGray900.withOpacity(0.14),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black90001.withOpacity(0.5),
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray900.withOpacity(0.14),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.amberA200,
          fontSize: 10,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing custom colors for the lightCode theme.
class LightCodeColors {
  Color get amberA200 => const Color(0xFFFFD33C);

  Color get black900 => const Color(0xFF0F0F0F);

  Color get black90001 => const Color(0xFF000000);

  Color get blueGray400 => const Color(0xFF878787);

  Color get blueGray900 => const Color(0xFF252831);

  Color get cyan600 => const Color(0xFF06B3C4);

  Color get gray900 => const Color(0xFF0D1634);

  Color get gray9000f => const Color(0x0F121212);

  Color get red500 => const Color(0xFFE74C3C);

  Color get whiteA700 => const Color(0xFFFFFFFF);

  Color get blueGray10033 => const Color(0x33D8D8D8);

  Color get primary => const Color(0xFF06B3C4);

  Color get primaryContainer => const Color(0xFFFFFFFF);

  Color get errorContainer => const Color(0xFF000000);

  Color get onPrimary => const Color(0xFF0F0F0F);

  Color get onPrimaryContainer => const Color(0x19878787);

  Color get gray50B2 => const Color(0xB2F5F5FF);

  Color get blueGray9000a => const Color(0x0A1B1B4D);

  Color get blueGray100 => const Color(0xFFD9D9D9);

  Color get blueGray100D8 => const Color(0xD8D8D8D8);
}

/// Define your custom color scheme here.
class MyColorSchemes {
  static final LightCodeColors lightCodeColors = LightCodeColors();
  static ColorScheme lightCodeColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightCodeColors.primary,
    onPrimary: Colors.white,
    secondary: Colors.green,
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );
}

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

// import 'package:flutter/material.dart';
// import 'package:hotelsbooking/core/app_export.dart';
// LightCodeColors get appTheme => ThemeHelper().themeColor();
// ThemeData get theme => ThemeHelper().themeData();
// /// Helper class for managing themes and colors.
// // ignore_for_file: must_be_immutable
// class ThemeHelper {
// // The current app theme
//   var _appTheme = PrefUtils().getThemeData();
//
//   Map<String, LightCodeColors> _supportedCustomColor = {
//     'lightCode': LightCodeColors()
//   };
//
// // A map of color schemes supported by the app
//   Map<String, ColorScheme> _supportedColorScheme = {
//     'lightCode': ColorSchemes.lightCodeColorScheme
//   };
//
//   /// Returns the lightCode colors for the current theme.
//   LightCodeColors _getThemeColors() {
//     return _supportedCustomColor[_appTheme] ?? LightCodeColors();
//   }
//
//   /// Returns the current theme data.
//   ///
//
//   ThemeData _getThemeData() {
//     var colorScheme =
//         _supportedColorScheme [_appTheme] ?? ColorSchemes.lightCodeColorScheme;
//     return ThemeData(
//       visualDensity: VisualDensity.standard,
//       colorScheme: colorScheme,
//       textTheme: TextThemes.textTheme(colorScheme),
//       scaffoldBackgroundColor: appTheme.whiteA700,
//     );
//   }
//
//   /// Returns the lightCode colors for the current theme.
//   LightCodeColors themeColor() => _getThemeColors();
//
//   ThemeData themeData() => _getThemeData();
// }
//
// class TextThemes {
//   static TextTheme textTheme (ColorScheme colorScheme) => TextTheme(
//     bodySmall: TextStyle(
//       color: appTheme.blueGray900.withOpacity (0.14),
//       fontSize: 12.fSize,
//       fontFamily: 'Inter',
//       fontWeight: FontWeight.w400,
//     ),
//     headlineSmall: TextStyle(
//       color: appTheme.black90001.withOpacity(0.5),
//       fontSize: 24.fSize,
//       fontFamily: 'Poppins',
//       fontWeight: FontWeight.w500,
//     ),
//     labelLarge: TextStyle(
//       color: appTheme.blueGray900.withOpacity(0.14),
//       fontSize: 12.fSize,
//       fontFamily: 'Inter',
//       fontWeight: FontWeight.w500,
//     ),
//     labelMedium: TextStyle(
//       color: appTheme.amberA200,
//       fontSize: 10.fSize,
//       fontFamily: 'Plus Jakarta Sans',
//       fontWeight: FontWeight.w700,
//     ),
//     titleMedium: TextStyle(
//       color: appTheme.black900,
//       fontSize: 16.fSize,
//       fontFamily: 'Poppins',
//       fontWeight: FontWeight.w700,
//     ),
//     titleSmall: TextStyle(
//       color: appTheme.black900,
//       fontSize: 14.fSize,
//       fontFamily: 'Poppins',
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }
//
// /// Class containing custom colors for a lightCode theme.
// class LightCodeColors {
//
//   Color get amberA200 => Color (0XFFFFD33C);
//   Color get black900 => Color (OXFF0F0F0F);
//   Color get black90001 => Color (0XFF000000);
//   Color get blueGray400 => Color (0XFF878787);
//   Color get blueGray900 => Color (0XFF252831);
//   Color get cyan600 => Color (0XFF06B3C4);
//   Color get gray900 => Color (0XFF0D1634);
//   Color get gray9000f => Color (0X0F121212);
//   Color get red500 => Color(0XFFE74C3C);
//   Color get whiteA700 => Color (0XFFFFFFFF);
// }
