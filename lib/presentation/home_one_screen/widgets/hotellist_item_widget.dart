import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/hotellist_item_model.dart';
// ignore_for_file: must_be_immutable
class HotellistItemWidget extends StatelessWidget {
  HotellistItemWidget(this.hotellistItemModelObj, {Key? key})
      : super(key: key,);
  HotellistItemModel hotellistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 218.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 268.h,
          width: 218.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: hotellistItemModelObj.dayOne!,
                height: 268.h,
                width: double.maxFinite,

              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(vertical: 14.h),
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.h,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadiusStyle.roundedBorder8,
                            ),
                            child: Text(
                              hotellistItemModelObj.price!,
                              textAlign: TextAlign.center,
                              style:
                              CustomTextStyles.labelMediumPoppinsBlack90001,
                            ),
                          ),
                          CustomImageView(
                            imagePath: hotellistItemModelObj.dayThree!,
                            height: 20.h,
                            width: 20.h,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700,
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.gray9000f,
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(
                              4,
                              4,
                            ),
                          )
                        ],
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath:
                                  ImageConstant.imgAntDesignStarFilled,
                                  height: 14.h,
                                  width: 14.h,
                                ),
                                Text(
                                  hotellistItemModelObj.fifty!,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  hotellistItemModelObj.fourhundredsixt!,
                                  style:
                                  CustomTextStyles.labelMediumBluegray400_1,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(

                            hotellistItemModelObj.theastonvil!,
                            style: CustomTextStyles.labelLargePoppinsBlack900,
                          ),
                          SizedBox(height: 6.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgLinkedin,
                                  height: 20.h,
                                  width: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    hotellistItemModelObj.streetromeny!,
                                    style:
                                      CustomTextStyles.labelMediumBluegray400,
                                  )
                                )
                              ],
                            ),
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
    );
  }
}
