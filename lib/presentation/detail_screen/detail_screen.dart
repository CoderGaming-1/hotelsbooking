import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/details_bloc.dart';
import 'models/details_model.dart';
import 'models/detailslist_item_model.dart';
import 'widgets/detailslist_item_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) => DetailsBloc(DetailsState(
        detailsModelObj: DetailsModel(),
      ))
        ..add(DetailsInitialEvent()),
      child: DetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: theme.colorScheme.primaryContainer,
      backgroundColor: appTheme.primaryContainer,
      appBar: _buildTopNavigation(context),
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 22.h,
              top: 20.h,
              right: 22.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSection(context),
                SizedBox(height: 12.h),
                _buildTabsRow(context),
                SizedBox(height: 12.h),
                _buildHotelInfoRow(context),
                _buildUserInfoRow(context),
                SizedBox(height: 4.h),
                Text(
                  "lbl_description".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: 292.h,
                  child: Text(
                    "msg_start_living_your".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80.h,
                  child: Divider(),
                ),
                SizedBox(height: 18.h),
                Text(
                  "msg_contact_98674456xx".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 4.h),
                Text(
                  "lbl_preview".tr,
                  style: CustomTextStyles.titleSmallPlusJakartaSansOnPrimary,
                ),
                SizedBox(height: 8.h),
                _buildDetailsList(context),
                SizedBox(height: 8.h)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBookingSection(context),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildTopNavigation(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 8.h,
          bottom: 8.h,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_details".tr,
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgVuesaxLinearMore,
          margin: EdgeInsets.only(
            top: 8.h,
            right: 23.h,
            bottom: 8.h,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.zero,
        color: appTheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Container(
          height: 246.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.primaryContainer,
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImageDefaultProperty1,
                height: 222.h,
                width: double.maxFinite,
                radius: BorderRadius.circular(
                  18.h,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20.h,
                  width: 22.h,
                  margin: EdgeInsets.only(
                    top: 12.h,
                    right: 14.h,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgHeart,
                        height: 20.h,
                        width: 20.h,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgHeart,
                        height: 20.h,
                        width: 20.h,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFreeWifiButton(BuildContext context) {
    // return CustomElevatedButton(
    //     width: 102.h,
    //     text: "lbl_free_wifi".tr,
    //     leftIcon: Container(
    //     margin: EdgeInsets.only(right: 8.h),
    // child: CustomImageView(
    // imagePath: ImageConstant.imgSettings,
    // height: 20.h,
    //   width: 20.h,
    //   fit: BoxFit.contain,
    // ),
    //     ),
    // );
    return Expanded(
      child: BlocSelector<DetailsBloc, DetailsState, TextEditingController?>(
        selector: (state) => state.breakfastInputController,
        builder: (context, breakfastInputController) {
          return CustomTextFormField(
            controller: breakfastInputController,
            hintText: "lbl_free_wifi".tr,
            textInputAction: TextInputAction.done,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(12.h, 8.h, 8.h, 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgSettings,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 36.h,
            ),
            contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 22.h, 8.h),
            borderDecoration: TextFormFieldStyleHelper.fillGrayB,
            filled: true,
            fillcolor: appTheme.gray50B2,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBreakfastInput(BuildContext context) {
    return Expanded(
      child: BlocSelector<DetailsBloc, DetailsState, TextEditingController?>(
        selector: (state) => state.breakfastInputController,
        builder: (context, breakfastInputController) {
          return CustomTextFormField(
            controller: breakfastInputController,
            hintText: "lbl_breakfast".tr,
            textInputAction: TextInputAction.done,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(12.h, 8.h, 8.h, 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgThumbsup,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 36.h,
            ),
            contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 26.h, 8.h),
            borderDecoration: TextFormFieldStyleHelper.fillGrayB,
            filled: true,
            fillcolor: appTheme.gray50B2,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildReviewButton(BuildContext context) {
    // return CustomElevatedButton(
    //   width: 72.h,
    //   text: "lbl_5_0".tr,
    //   leftIcon: Container(
    //     margin: EdgeInsets.only(right: 8.h),
    //     child: CustomImageView(
    //       imagePath: ImageConstant.imgAntdesignstarfilled,
    //       height: 20.h,
    //       width: 20.h,
    //       fit: BoxFit.contain,
    //     ),
    //   ),
    // );
    return Expanded(
      child: BlocSelector<DetailsBloc, DetailsState, TextEditingController?>(
        selector: (state) => state.breakfastInputController,
        builder: (context, breakfastInputController) {
          return CustomTextFormField(
            controller: breakfastInputController,
            hintText: "lbl_5_0".tr,
            textInputAction: TextInputAction.done,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(12.h, 8.h, 8.h, 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgAntdesignstarfilled,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 36.h,
            ),
            // contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 12.h, 8.h),
            width: 200.0,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 8.h, vertical: 6.h),
            borderDecoration: TextFormFieldStyleHelper.fillGrayB,
            filled: true,
            fillcolor: appTheme.gray50B2,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTabsRow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          _buildFreeWifiButton(context),
          SizedBox(width: 8.h),
          _buildBreakfastInput(context),
          SizedBox(width: 8.h),
          _buildReviewButton(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHotelInfoRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg_the_aston_vil_hotel".tr,
            // style: CustomTextStyles.titleMediumPlusJakartaSansOnPrimary,
            style: CustomTextStyles.titleMediumBlack900,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "lbl_38_day".tr,
              style: CustomTextStyles.titleSmallInterPrimary,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserInfoRow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 18.h,
            width: 18.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "msg_upper_indira_nagar".tr,
              // style: CustomTextStyles.labelLargeOnPrimaryContainer,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.50,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDetailsList(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: BlocSelector<DetailsBloc, DetailsState, DetailsModel?>(
        selector: (state) => state.detailsModelObj,
        builder: (context, detailsModelObj) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 16.h,
              children: List.generate(
                detailsModelObj?.detailslistItemList.length ?? 0,
                (index) {
                  DetailslistItemModel model =
                      detailsModelObj?.detailslistItemList[index] ??
                          DetailslistItemModel();
                  return DetailslistItemWidget(
                    model,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBookNowButton(BuildContext context) {
    return CustomElevatedButton(
      height: 52.h,
      text: "lbl_book_now".tr,
      margin: EdgeInsets.only(bottom: 12.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.labelMediumBlack90001,
      onPressed: () {
        Navigator.pushNamed(context, '/fromdetails_screen');
      },
    );
  }

  /// Section Widget
  Widget _buildBookingSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildBookNowButton(context)],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
