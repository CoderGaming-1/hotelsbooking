import 'package:flutter/material.dart' hide SearchController;
import '../../../core/app_export.dart';
import '../models/hotelgrid_item_model.dart';

// ignore_for_file: must_be_immutable
class HotelgridItemWidget extends StatelessWidget {
  HotelgridItemWidget(this.hotelgridItemModelObj, {Key? key})
      : super(
          key: key,
        );
  HotelgridItemModel hotelgridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgViewBuildingw,
          height: 116.h,
          width: double.maxFinite,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadiusStyle.customBorderBL12,
            boxShadow: [
              BoxShadow(
                color: appTheme.blueGray9000a,
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignal,
                      height: 14.h,
                      width: 14.h,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_5_0".tr,
                            style: CustomTextStyles
                                .labelMediumPlusJakartaSansAmberA200Bold,
                          ),
                          TextSpan(
                            text: "lbl_463".tr,
                            style: CustomTextStyles
                                .labelLargePlusJakartaSansBlack90001,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                hotelgridItemModelObj.muongthanh!,
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 4.h),
              Text(
                hotelgridItemModelObj.alicesprings!,
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.h,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_382".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: "lbl_299".tr,
                        style: theme.textTheme.labelSmall,
                      )
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
