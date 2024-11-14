import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/filter_one_item_model.dart';
// ignore_for_file: must_be_immutable
class FilterOneItemWidget extends StatelessWidget {
  FilterOneItemWidget(this.filterOneItemModelObj, {Key? key})
      : super(
    key: key,);
  FilterOneItemModel filterOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadiusStyle.roundedBorder10,
        border: Border.all(
          color: appTheme.blueGray400,
          width: 1.h,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAntDesignStarFilled,

            height: 14.h,
            width: 14.h,
          ),
          SizedBox(width: 2.h),
          Text(
            filterOneItemModelObj.five!,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}