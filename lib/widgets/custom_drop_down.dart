import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
class CustomDropDown extends StatelessWidget {
  CustomDropDown (
      {Key? key,
        this.alignment,
        this.width,
        this.boxDecoration,
        this.focusNode,
        this.icon,
        this.iconSize,
        this.autofocus = false,
        this.textStyle,
        this.hintText,
        this.hintStyle,
        this.items,
        this.prefix,
        this.prefixConstraints,
        this.contentPadding,
        this.validator,
        this.onChanged})
      :
        super(
        key: key,
      );
  final Alignment? alignment;

  final double? width;
  final BoxDecoration? boxDecoration;
  final FocusNode? focusNode;
  final Widget? icon;
  final double? iconSize;
  final bool? autofocus;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<SelectionPopupModel>? items;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final EdgeInsets? contentPadding;
  final FormFieldValidator<SelectionPopupModel>? validator;

  final Function (SelectionPopupModel)? onChanged;
  @override
  Widget build (BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: dropDownWidget)
        : dropDownWidget;
  }
  Widget get dropDownWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: DropdownButtonFormField<SelectionPopupModel>(
      focusNode: focusNode,
      icon: icon,
      iconSize: iconSize ?? 24,
      autofocus: autofocus!,
      isExpanded: true,
      style: textStyle ?? theme.textTheme.titleSmall,
      hint: Text(
        hintText ?? "",
        style: hintStyle ?? theme.textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
      items: items?.map((SelectionPopupModel item) {
        return DropdownMenuItem<SelectionPopupModel>(
          value: item,
          child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: hintStyle ?? theme.textTheme.titleSmall,
          ),
        );
      }).toList(),
      decoration: decoration,
      validator: validator,
      onChanged: (value) {
        onChanged! (value!);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    isDense: true,
    contentPadding: contentPadding,
    border: InputBorder.none,
  );
}

