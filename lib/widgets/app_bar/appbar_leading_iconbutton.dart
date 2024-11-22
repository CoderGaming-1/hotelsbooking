import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_icon_button.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          // Handle navigation to the detail screen
          Navigator.pushNamed(context, '/detail_screen');
        },
        child: imagePath != null
            ? Image.asset(
          imagePath!,
          height: height ?? 24.0, // default height if not provided
          width: width ?? 24.0, // default width if not provided
          fit: BoxFit.contain,
        )
            : Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
    );
  }
}
