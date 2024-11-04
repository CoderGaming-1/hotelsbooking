import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/bookinglistsection_item_model.dart';
// ignore_for_file: must_be_immutable
class BookinglistsectionItemWidget extends StatelessWidget {
  BookinglistsectionItemWidget(this.bookinglistsectionItemModelObj, {Key? key})
      :
        super(
        key: key, );
  BookinglistsectionItemModel bookinglistsectionItemModelObj;
  @override
  Widget build (BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 14.h,
    ),
    decoration: BoxDecoration(
    color: appTheme.blueGray400.withOpacity(0.1),
    borderRadius: BorderRadiusStyle.roundedBorder16,
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    SizedBox(
    width: double.maxFinite,
    child: Row(
    children: [
    CustomImageView(
    imagePath: ImageConstant.imgImage9,


    height: 80.h,
    width: 80.h,
    radius: BorderRadius.circular(
    8.h,
    ),
    ),
    Expanded(
    child: Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    width: double.maxFinite,
    margin: EdgeInsets.only(bottom: 4.h),
    padding: EdgeInsets.symmetric (horizontal: 16.h),
    child: Column(
    children: [
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: "msg_zeyzang_resort_hotel".tr,
    style: CustomTextStyles.labelLargePoppinsBlack90001SemiBold_1,
    ),
    TextSpan(
    text: "msg_507_university_st_endicolt".tr,

    style: CustomTextStyles.labelMediumBlack90001,
    )
    ],
    ),
    textAlign: TextAlign.left,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
    SizedBox(height: 8.h),


    Container(
    width: double.maxFinite,
    margin: EdgeInsets.only(
    left: 10.h,
    right: 18.h,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: "lbl 38".tr,
    style: CustomTextStyles.labelMediumCyan600, ),
    TextSpan(
    text: "lbl_night".tr,
    style: CustomTextStyles.labelMediumBlack90001_1,
    )
    ],
    ),
    textAlign: TextAlign.left,
    ),
    Expanded(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Spacer(),
    CustomImageView(
    imagePath: bookinglistsectionItemModelObj.imageOne!,
      height: 14.h,
      width: 14.h,
    ),
      Text(
        bookinglistsectionItemModelObj.fifty!,
        style: CustomTextStyles.labelMediumPlusJakartaSansAmberA200,
      ),
      Text(
        bookinglistsectionItemModelObj.fourhundredsixt!,
        style: CustomTextStyles.labelMediumPlusJakartaSansBluegray400Bold,
    )
        ],
      ),
    )
    ],
    ),
    )
      ],
    ),
    ),
    ),
    )
      ],
    ),
    ),
        SizedBox(height: 8.h),
        Container(
        margin: EdgeInsets.symmetric (horizontal: 4.h),
    padding: EdgeInsets.symmetric(
    horizontal: 32.h,



    vertical: 10.h,
    ),
    decoration: BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadiusStyle.roundedBorder20,
    ),
    width: double.maxFinite,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    SizedBox(
    width: 50.h,
    child: RichText(
    text: TextSpan (
    children: [
    TextSpan(
    text: "lbl_check_in".tr,
    style: CustomTextStyles.labelLargePlusJakartaSansBlack90001, ),
    TextSpan(
    text: "lbl_12_june".tr,
    style: theme.textTheme.titleSmall,
    )
    ],
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
    ),
    CustomImageView(
    imagePath: ImageConstant.imgArrowRight,
    height: 24.h,



    width: 24.h,
    ),
    SizedBox(
    width: 50.h,
    child: RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: "lbl_check_in".tr,
    style:
    CustomTextStyles.labelLargePlusJakartaSansGray800,
    ),
    TextSpan(
    text: "lbl_12_june".tr,
    style: theme.textTheme.titleSmall,
    )
    ],
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
    )
    ],
    ),
        )
    ],
    ),
    );
  }
}