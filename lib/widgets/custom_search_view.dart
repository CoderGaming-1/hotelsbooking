// import 'package:flutter/material.dart';
// import 'package:hotelsbooking/core/app_export.dart';
//
// extension SearchViewStyleHelper on CustomSearchView {
//   static OutlineInputBorder get outlineCyan => OutlineInputBorder(
//   borderRadius: BorderRadius.circular(16.h),
//   borderSide: BorderSide(
//   color: appTheme.cyan600,
//   width: 1,
//   ),
//   );
// }
//
// class CustomSearchView extends StatelessWidget {
//   static String imagePath = 'assets/images';
//   static String imgSettings = '$imagePath/img_filter.png';
//   CustomSearchView({Key? key,
//     this.alignment,
//     this.width,
//     this.boxDecoration,
//     this.scrollPadding,
//     this.controller,
//     this.focusNode,
//     this.autofocus = false,
//     this.textStyle,
//     this.textInputType = TextInputType.text,
//     this.maxLines,
//     this.hintText,
//     this.hintStyle,
//     this.prefix,
//     this.prefixConstraints,
//     this.suffix,
//     this.suffixConstraints,
//     this.contentPadding,
//     this.borderDecoration,
//     this.fillColor,
//     this.filled = true,
//     this.validator,
//     this.onChanged})
//       : super(key: key,);
//   final Alignment? alignment;
//   final double? width;
//   final BoxDecoration? boxDecoration;
//   final TextEditingController? scrollPadding;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final bool? autofocus;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final int? maxLines;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final Widget? prefix;
//
//   final BoxConstraints? prefixConstraints;
//   final Widget? suffix;
//   final BoxConstraints? suffixConstraints;
//   final EdgeInsets? contentPadding;
//   final InputBorder? borderDecoration;
//   final Color? fillColor;
//   final bool? filled;
//   final FormFieldValidator<String>? validator;
//   final Function (String)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//         alignment: alignment ?? Alignment.center,
//         child: searchViewWidget(context))
//         : searchViewWidget(context);
//   }
//
//   Widget searchViewWidget(BuildContext context) =>
//       Container(
//         width: width ?? double.maxFinite,
//
//         decoration: boxDecoration,
//         child: TextFormField(
//           scrollPadding:
//           EdgeInsets.only(bottom: MediaQuery
//               .of(context)
//               .viewInsets
//               .bottom),
//           controller: controller,
//           focusNode: focusNode,
//           onTapOutside: (event) {
//             if (focusNode != null) {
//               focusNode?.unfocus();
//             } else {
//               FocusManager.instance.primaryFocus?.unfocus();
//             }
//           },
//           autofocus: autofocus!,
//           style: textStyle ?? CustomTextStyles.titleSmallBluegray400,
//           keyboardType: textInputType,
//           maxLines: maxLines ?? 1,
//           decoration: decoration,
//           validator: validator,
//           onChanged: (String value) {
//             onChanged?.call(value);
//           },
//           onFieldSubmitted: (String value) {  // Trigger navigation on enter
//             Navigator.pushNamed(context, '/search_screen');
//           },
//         ),
//       );
//
//   InputDecoration get decoration =>
//       InputDecoration(
//           hintText: hintText ?? "",
//           hintStyle: hintStyle ?? CustomTextStyles.titleSmallBluegray400,
//           prefixIcon: Padding(
//             padding: EdgeInsets.all(
//               15.h,
//             ),
//             child: Icon(
//               Icons.search,
//               color: Colors.grey.shade600,
//             ),
//           ),
//           prefixIconConstraints: prefixConstraints ??
//               BoxConstraints(
//                 maxHeight: 56.h,
//               ),
//           suffixIcon: suffix ??
//               Padding(
//                 padding: EdgeInsets.only(
//                   right: 15.h,
//                 ),
//                 // child: IconButton(
//                 //   onPressed: () => controller!.clear(),
//                 //   icon: Icon(
//                 //     Icons.clear,
//                 //     color: Colors.grey.shade600,
//                 //   ),
//                 // ),
//                 // child: GestureDetector(
//                 //   onTap: () => controller?.clear(),  // Clears the text when the image is tapped
//                 //   child: Image.asset(
//                 //     imgSettings,
//                 //     height: 24.h,
//                 //     width: 24.h,
//                 //   ),
//
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/filter_screen');  // Routes to /filter_screen when tapped
//                   },
//                   child: Image.asset(
//                     imgSettings,
//                     height: 24.h,
//                     width: 24.h,
//                 ),
//                 ),
//               ),
//           suffixIconConstraints: suffixConstraints ??
//               BoxConstraints(
//                 maxHeight: 56.h,
//               ),
//           isDense: true,
//           contentPadding:
//           contentPadding ?? EdgeInsets.fromLTRB(12.h, 16.h, 16.h, 16.h),
//           fillColor: fillColor ?? appTheme.whiteA700,
//           filled: filled,
//           border: borderDecoration ??
//               OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16.h),
//                 borderSide: BorderSide(
//                   color: appTheme.blueGray400,
//
//                   width: 1,
//                 ),
//               ),
//           enabledBorder: borderDecoration ?? OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16.h),
//             borderSide: BorderSide(
//               color: appTheme.blueGray400,
//               width: 1,
//   ),
//   ),
//   focusedBorder: borderDecoration ??
//   OutlineInputBorder(
//   borderRadius: BorderRadius.circular(16.h),
//   borderSide: BorderSide(
//   color: appTheme.blueGray400,
//   width: 1,
//   ),
//   ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';

extension SearchViewStyleHelper on CustomSearchView {
  static OutlineInputBorder get outlineCyan => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.h),
        borderSide: BorderSide(
          color: appTheme.cyan600,
          width: 1,
        ),
      );
}

class CustomSearchView extends StatelessWidget {
  static String imagePath = 'assets/images';
  static String imgSettings = '$imagePath/img_filter.png';

  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context),
          )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus,
          style: textStyle ?? CustomTextStyles.titleSmallBluegray400,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration(context),
          validator: validator,
          onChanged: (String value) {
            onChanged?.call(value);
          },
          onFieldSubmitted: (String value) {
            Navigator.pushNamed(context, '/search_screen');
          },
        ),
      );

  InputDecoration decoration(BuildContext context) => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.titleSmallBluegray400,
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.h),
          child: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
        prefixIconConstraints: prefixConstraints ??
            BoxConstraints(
              maxHeight: 56.h,
            ),
        suffixIcon: suffix ??
            Padding(
              padding: EdgeInsets.only(right: 15.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/filter_screen');
                },
                child: Image.asset(
                  imgSettings,
                  height: 24.h,
                  width: 24.h,
                ),
              ),
            ),
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 56.h,
            ),
        isDense: true,
        contentPadding:
            contentPadding ?? EdgeInsets.fromLTRB(12.h, 16.h, 16.h, 16.h),
        fillColor: fillColor ?? appTheme.whiteA700,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(
                color: appTheme.blueGray400,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(
                color: appTheme.blueGray400,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(
                color: appTheme.blueGray400,
                width: 1,
              ),
            ),
      );
}
