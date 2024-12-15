import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}

class CustomTextStyles {
  // static TextStyle get titleSmallRobotoWhiteA700
  // => theme.textTheme.titleSmall!.roboto.copyWith(
  //   color: appTheme.whiteA700,
  //   fontWeight: FontWeight.w500,
  // );
  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallWhiteA700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallRobotoWhiteA700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

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

  static TextStyle get titleSmallPoppinsRedA700 =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: appTheme.red500,
        fontWeight: FontWeight.w500,
      );

  /// titleSmallPoppinsPrimary titleMediumBlack900
  ///
  static TextStyle get titleSmallPoppinsPrimary =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumBlack900 =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBlack90001 =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargePoppinsBlack90001SemiBold_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumBlack90001 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelMediumCyan600 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.cyan600,
      );

  static TextStyle get labelMediumBlack90001_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
      );

  static TextStyle get labelMediumPlusJakartaSansAmberA200 =>
      theme.textTheme.labelMedium!.plusJakartaSans.copyWith(
        color: appTheme.amberA200,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumPlusJakartaSansBluegray400Bold =>
      theme.textTheme.labelMedium!.plusJakartaSans.copyWith(
        color: appTheme.blueGray400,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePlusJakartaSansBlack90001Bold =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePlusJakartaSansBlack90001 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePlusJakartaSansGray800 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumPlusJakartaSansAmberA200Bold =>
      theme.textTheme.labelMedium!.plusJakartaSans.copyWith(
        color: appTheme.amberA200,
        fontWeight: FontWeight.w700,
        fontSize: 10.h
      );

  static TextStyle get labelMediumPlusJakartaSansBlack900Bold =>
      theme.textTheme.labelMedium!.plusJakartaSans.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );

  static TextStyle get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodySmallErrorContainer =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static TextStyle get titleSmallPlusJakartaSansOnPrimary =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallInterPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallPlusJakartaSansPrimaryContainer =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMediumPlusJakartaSansOnPrimary =>
      theme.textTheme.titleMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallPlusJakartaSansBlack900 =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargePlusJakartaSansOnPrimaryContainer =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );

  static TextStyle get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmall0nPrimaryContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );

  static TextStyle get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
}
