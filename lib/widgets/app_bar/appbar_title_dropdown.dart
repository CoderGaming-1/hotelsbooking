import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:hotelsbooking/widgets/custom_drop_down.dart';

class AppbarTitleDropdown extends StatelessWidget {
  AppbarTitleDropdown(
      {Key? key,
      required this.hintText,
      required this.items,
      required this.onTap,
      this.margin})
      : super(
          key: key,
        );
  final String? hintText;
  final List<SelectionPopupModel> items;
  final Function(SelectionPopupModel) onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: double.maxFinite,
        child: CustomDropDown(
          icon: Container(
            margin: EdgeInsets.only(left: 4.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowdown,
              height: 22.h,
              width: 24.h,
              fit: BoxFit.contain,
            ),
          ),
          iconSize: 22.h,
          hintText: "msg_chenango_new_york".tr,
          items: items,
          // prefix: Container(
          //   margin: EdgeInsets.only(right: 8.h),
          //   child: CustomImageView(
          //     imagePath: ImageConstant.imgUser,
          //     height: 22.h,
          //     width: 20.h,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          prefixConstraints: BoxConstraints(
            maxHeight: 24.h,
          ),
        ),
      ),
    );
  }
}
