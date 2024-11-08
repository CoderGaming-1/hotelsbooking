import 'package:flutter/material.dart';
import '../core/app_export.dart';
extension CustomCheckBoxStyleHelper on CustomCheckboxButton {
  static BoxDecoration get fillPrimaryContainer =>
      BoxDecoration(
        color: appTheme.primaryContainer,

      );
}
// ignore_for_file: must_be_immutable
  class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton(
  {Key? key,
  required this.onChange,
  this.decoration,
  this.alignment,
  this.isRightCheck,
  this.iconSize,
  this.value,
  this.text,
  this.width,
  this.padding,
  this.textStyle,
  this.overflow,
  this.textAlignment,
  this.isExpandedText = false})
      : super(
  key: key,
  );
  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightCheck;
  final double? iconSize;
  bool? value;
  final Function (bool) onChange;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlignment;
  final bool isExpandedText;
  @override
  Widget build (BuildContext context) {
  return alignment != null
  ? Align(
  alignment: alignment ?? Alignment.center, child: buildCheckBoxWidget)
      : buildCheckBoxWidget;
  }
  Widget get buildCheckBoxWidget => GestureDetector(
  onTap: () {
  value = !(value!);


  onChange (value!);
  },
  child: Container(
  decoration: decoration,
  width: width,
  padding: padding,
  child: (isRightCheck ?? false) ? rightSideCheckbox: leftSideCheckbox,
  ),
  );
  Widget get leftSideCheckbox => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
  checkboxWidget,
  SizedBox(
  width: text != null && text!.isNotEmpty ? 8:0,
  ),
  isExpandedText ? Expanded (child: textwidget): textwidget
  ],
  );
  Widget get rightSideCheckbox => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  isExpandedText ? Expanded (child: textwidget): textwidget,
  SizedBox(
  width: text != null && text!.isNotEmpty ? 8:0,
  ),
  checkboxWidget
  ],
  );
  Widget get textwidget => Text(
  text ?? "" ,
  textAlign: textAlignment ?? TextAlign.start,
  overflow: overflow,
  style: textStyle ?? theme.textTheme.labelLarge,
  );
  Widget get checkboxWidget => SizedBox(
  height: iconSize ?? 20.h,
  width: iconSize ?? 20.h,
  child: Checkbox(
  visualDensity: VisualDensity(
  vertical: -4,
  horizontal: -4,
  ),
  value: value ?? false,
  checkColor: theme.colorScheme.primary,
  activeColor: theme.colorScheme.primaryContainer,
  side: WidgetStateBorderSide.resolveWith(
  (states) => BorderSide(
  color: theme.colorScheme.primaryContainer,
  ),
  ),
  onChanged: (value) {
  onChange(value!);
  },
  ),
  );
  }