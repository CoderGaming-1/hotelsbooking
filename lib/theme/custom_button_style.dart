import 'package:flutter/material.dart';
import '../core/app_export.dart';
/// A class that offers pre-defined button styles for customizing button appea
class CustomButtonStyles {
// Filled button style
  static ButtonStyle get fillPrimary =>
      ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),),
  elevation:0,
  padding:EdgeInsets.zero,);
  static const Color cyan600 = Color(0xFF06B3C4);

  static ButtonStyle get onChoose =>
      ElevatedButton.styleFrom(
        backgroundColor: cyan600, // Set the background color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );


// text button style
  static ButtonStyle get none =>
      ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
          elevation: WidgetStateProperty.all<double>(0),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(color: Colors.transparent),
          ));
}