import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/favoritegrid_item_model.dart';

// ignore_for_file: must_be_immutable
class FavoritegridItemWidget extends StatelessWidget {
  FavoritegridItemWidget(this.favoritegridItemModelObj, {Key? key})
      : super(
          key: key,
        );
  FavoritegridItemModel favoritegridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 116.h,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgViewBuildingw,
                height: 116.h,
                width: double.maxFinite,
                radius: BorderRadius.circular(16),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFavorite,
                height: 18.h,
                width: 20.h,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(
                  top: 8.h,
                  right: 8.h,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadiusStyle.customBorderBL12,

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
                      imagePath: ImageConstant.imgAntDesignStarFilled,
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
                                .labelMediumPlusJakartaSansBlack900Bold,
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
                favoritegridItemModelObj.muongthanh!,
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 4.h),
              Text(
                favoritegridItemModelObj.alicesprings!,
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
                        text: " ", // Space TextSpan
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
