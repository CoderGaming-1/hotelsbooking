import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/checkout_three_item_model.dart';

// ignore_for_file: must_be_immutable
class CheckoutThreeItemWidget extends StatelessWidget {
  CheckoutThreeItemWidget(this.checkoutThreeItemModelObj, {Key? key})
      : super(
          key: key,
        );
  CheckoutThreeItemModel checkoutThreeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.onPrimaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: checkoutThreeItemModelObj.dateOne!,
            height: 24.h,
            width: 26.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              checkoutThreeItemModelObj.datesTwo!,
              style: theme.textTheme.labelLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Text(
              checkoutThreeItemModelObj.nov2024!,
              style: theme.textTheme.labelLarge,
            ),
          )
        ],
      ),
    );
  }
}
