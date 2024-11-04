import 'package:flutter/material.dart';
import '../core/app_export.dart';
/// A class that offers pre-defined button styles for customizing button appea
class CustomButtonStyles {
// Filled button style
  static ButtonStyle get fillPrimary =>
      ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),),
  elevation:0,
  padding:EdgeInsets.zero,);

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