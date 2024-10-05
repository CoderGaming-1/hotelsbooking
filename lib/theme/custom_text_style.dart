import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
extension on TextStyle {
  TextStyle get poppins {
    return copyWith( fontFamily: 'Poppins', );
  }
  TextStyle get inter {
    return copyWith( fontFamily: 'Inter', );
  }
  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}

class CustomTextStyles {
// Headline text style
  static TextStyle get headlineSmallBlack90001 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get headlineSmallBlack90001Bold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w700,
      );

// Label text style
  static TextStyle get labelLargeCyan600 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.cyan600,
      );

  static TextStyle get labelLargePlusJakartaSansBlack900 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePlusJakartaSansBluegray400 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.blueGray400,
      );

  static TextStyle get labelLargePoppinsBlack900 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePoppinsBlack90001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
        fontWeight: FontWeight.w600,
  );
  static TextStyle get labelMediumBluegray400 =>
  theme.textTheme.labelMedium!.copyWith(
  color: appTheme.blueGray400,
  fontWeight: FontWeight.w500,
  );
  static TextStyle get labelMediumBluegray400_1 =>
  theme.textTheme.labelMedium!.copyWith(
  color: appTheme.blueGray400,
  );

  static TextStyle get labelMediumPoppinsBlack90001 =>
  theme.textTheme.labelMedium!.poppins.copyWith(
  color: appTheme.black90001,
  fontWeight: FontWeight.w600,
  );
// Title style
  static get titleMediumPlusJakartaSans =>
  theme.textTheme.titleMedium!.plusJakartaSans;
  static TextStyle get titleSmallBluegray400 =>
  theme.textTheme.titleSmall!.copyWith(
  color: appTheme.blueGray400,
  );
  static TextStyle get titleSmallCyan600 =>
  theme.textTheme.titleSmall!.copyWith(
  color: appTheme.cyan600,
  fontWeight: FontWeight.w500,
  );
  static TextStyle get titleSmallInterCyan600 =>
  theme.textTheme.titleSmall!.inter.copyWith(
  color: appTheme.cyan600,
  fontWeight: FontWeight.w700,
  );
  static TextStyle get titleSmallPlusJakartaSans =>
  theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
  fontWeight: FontWeight.w700,
  );

}
