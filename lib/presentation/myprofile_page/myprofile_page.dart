import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/myprofile_bloc.dart';
import 'models/myprofile_model.dart'; // ignore_for_file: must_be_immutable

class MyprofilePage extends StatelessWidget {
  const MyprofilePage({Key? key})
      : super(
          key: key,
        );
  static Widget builder(BuildContext context) {
    return BlocProvider<MyprofileBloc>(
      create: (context) => MyprofileBloc(MyprofileState(
        myprofileModelObj: MyprofileModel(),
      ))
        ..add(MyprofileInitialEvent()),
      child: MyprofilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyprofileBloc, MyprofileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: _buildTopNavigation(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 30.h,
                top: 4.h,
                right: 30.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAvatars3dAvatar1,
                    height: 100.h,
                    width: 102.h,
                  ),
                  SizedBox(height: 4.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "lbl_general".tr,
                        style: CustomTextStyles.titleMediumBlack90001,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildEditProfileSection(context),
                  SizedBox(height: 12.h),
                  _buildChangePasswordSection(context),
                  SizedBox(height: 12.h),
                  _buildSecuritySection(context),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    text: "lbl_logout".tr,
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 10.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgLogout,
                        height: 24.h,
                        width: 24.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopNavigation(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
            ),
            AppbarTitle(
              text: "lbl_my_profile".tr,
              margin: EdgeInsets.only(left: 83.h),
            )
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVuesaxLinearMore,
          margin: EdgeInsets.only(right: 31.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfileSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: appTheme.blueGray400.withOpacity(0.1),
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLock,
            height: 20.h,
            width: 22.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_edit_profile".tr,
              style: CustomTextStyles.titleSmallPoppinsPrimary,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/editprofile_screen');
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightPrimary,
              height: 24.h,
              width: 26.h,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChangePasswordSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: appTheme.blueGray400.withOpacity(0.1),
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPassword,
            height: 24.h,
            width: 26.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_change_password".tr,
              style: CustomTextStyles.titleSmallPoppinsPrimary,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPrimary,
            height: 24.h,
            width: 26.h,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSecuritySection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: appTheme.blueGray400.withOpacity(0.1),
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSecurity,
            height: 24.h,
            width: 26.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_security".tr,
              style: CustomTextStyles.titleSmallPoppinsPrimary,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPrimary,
            height: 24.h,
            width: 26.h,
          )
        ],
      ),
    );
  }
}
