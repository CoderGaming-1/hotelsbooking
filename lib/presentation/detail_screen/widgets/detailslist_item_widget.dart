import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/detailslist_item_model.dart';
// ignore_for_file: must_be_immutable
class DetailslistItemWidget extends StatelessWidget {
  DetailslistItemWidget(this.detailslistItemModelObj, {Key? key}) :super(key: key, );
  DetailslistItemModel detailslistItemModelObj;
  @override
  Widget build (BuildContext context) {
    return SizedBox(
      width: 98.h,
      child: CustomImageView(
        imagePath: detailslistItemModelObj.image!,
        height: 82.h,
        width: 98.h,
        radius: BorderRadius.circular(
          8.h,
        ),
      ),
    );
  }
}