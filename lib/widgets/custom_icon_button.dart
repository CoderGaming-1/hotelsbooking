import 'package:flutter/material.dart';
import '../core/app_export.dart';
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineGrayTL8 => BoxDecoration(
  borderRadius: BorderRadius.circular(8.h),
  border: Border.all(
    color: appTheme.gray900,
    width: 1.h,
  ),
  boxShadow: [
  BoxShadow(
  spreadRadius: 2.h,
  blurRadius: 2.h,
  )
  ],
  );
  static BoxDecoration get outline => BoxDecoration(
  color: theme.colorScheme.primaryContainer,
  borderRadius: BorderRadius.circular(8.h),
  boxShadow: [
  BoxShadow(
  spreadRadius: 2.h,
  blurRadius: 2.h,
  )
  ],
  );
  static BoxDecoration get none => BoxDecoration();
}
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
  {Key? key,
  this.alignment,
    this.height, this.width, this.decoration, this.padding, this.onTap, this.child}) : super( key: key, );
  final Alignment? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? child;
  @override
  Widget build (BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }
    Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
      width: width ?? 0,
      child: DecoratedBox(
        decoration: decoration ??
            BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular (8.h),
              border: Border.all(
                color: appTheme.gray900,
                width: 1.h,
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                )
              ],
            ),
        child: IconButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onTap,
          icon: child ?? Container(),
        ),
      ),
    );
  }