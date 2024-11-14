import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillWhiteA =>
      BoxDecoration(color: appTheme.whiteA700);

  // Outline decorations
  static BoxDecoration get outlineGrayF => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000f.withOpacity(0.04),
            spreadRadius: 2.0, // replaced 2.h with 2.0 assuming 2 is a double
            blurRadius: 2.0,
            offset: Offset(4, 4),
          ),
        ],
      );

  // Shadow decorations
  static BoxDecoration get shadowCard => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000f,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(4, 4),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL12 =>
      BorderRadius.vertical(top: Radius.circular(12.0));

  // Rounded borders
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
        14.0,
      );

  static BorderRadius get roundedBorder18 => BorderRadius.circular(
        18.0,
      );

  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.0,
      );

  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.0,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.0,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        16.0,
      );

  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
        bottom: Radius.circular(12.h),
      );

  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.0,
      );

  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.0,
      );

  static BorderRadius get roundedBorder32 => BorderRadius.circular(
        32.0,
      );
}
