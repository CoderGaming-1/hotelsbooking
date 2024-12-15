import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/bookinglistsection_item_model_booked.dart';

// ignore_for_file: must_be_immutable
class BookinglistsectionItemWidgetBooked extends StatelessWidget {
  BookinglistsectionItemWidgetBooked(this.bookinglistsectionItemModelBookedObj, {Key? key})
      : super(key: key,);
  BookinglistsectionItemModelBooked bookinglistsectionItemModelBookedObj;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.blueGray100.withOpacity(0.2), // Different color for "Booked"
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBookedHotelItem(
            imagePath: bookinglistsectionItemModelBookedObj.imageOne ?? ImageConstant.imgAntDesignStarFilled,
            title: "Booked Hotel Name",
            location: "123 Main St, Booked City",
            price: "\$70",
          ),
        ],
      ),
    );
  }
  Widget _buildBookedHotelItem({
    required String imagePath,
    required String title,
    required String location,
    required String price,
  }) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              CustomImageView(
                imagePath: imagePath,
                height: 80.h,
                width: 80.h,
                radius: BorderRadius.circular(8.h),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: 4.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyles.labelLargePoppinsBlack90001SemiBold_1,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          location,
                          style: CustomTextStyles.labelMediumBlack90001,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: price,
                                    style: CustomTextStyles.labelMediumCyan600,
                                  ),
                                  TextSpan(
                                    text: "lbl_night".tr,
                                    style: CustomTextStyles.labelMediumBlack90001_1,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgAntDesignStarFilled,
                                  height: 14.h,
                                  width: 14.h,
                                ),
                                SizedBox(width: 4.h),
                                Text(
                                  bookinglistsectionItemModelBookedObj.fifty!,
                                  style: CustomTextStyles.labelMediumPlusJakartaSansAmberA200,
                                ),
                                SizedBox(width: 4.h),
                                Text(
                                  bookinglistsectionItemModelBookedObj.fourhundredsixt!,
                                  style: CustomTextStyles.labelMediumPlusJakartaSansBluegray400Bold,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.h),
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
              Column(
                children: [
                  Text(
                    "lbl_check_in".tr,
                    style: CustomTextStyles.labelLargePlusJakartaSansBlack90001,
                  ),
                  Text(
                    "lbl_15_june".tr, // Different date for "Booked"
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 24.h,
                width: 24.h,
              ),
              Column(
                children: [
                  Text(
                    "lbl_check_out",
                    style: CustomTextStyles.labelLargePlusJakartaSansGray800,
                  ),
                  Text(
                    "lbl_18_june".tr, // Different date for "Booked"
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
