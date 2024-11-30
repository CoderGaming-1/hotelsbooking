import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/editprofile_bloc.dart';
import 'models/editprofile_model.dart';

// ignore_for_file: must_be_immutable
class EditprofileScreen extends StatelessWidget {
  EditprofileScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<EditprofileBloc>(
      create: (context) => EditprofileBloc(EditprofileState(
        editprofileModelObj: EditprofileModel(),
      ))
        ..add(EditprofileInitialEvent()),
      child: EditprofileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          height: SizeUtils.height,
          child: Form(
            key: _formkey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  _buildTopNavigation(context),
                  SizedBox(height: 12.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgAvatars3dAvatar1,
                    height: 100.h,
                    width: 102.h,
                  ),
                  SizedBox(height: 6.h),
                  _buildUsernameSection(context),
                  SizedBox(height: 10.h),
                  _buildEmailSection(context),
                  SizedBox(height: 14.h),
                  _buildPhoneNumberSection(context),
                  Spacer(),
                  CustomElevatedButton(
                    height: 48.h,
                    text: "Save_Changes".tr,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 22.h,
                    ),
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    buttonTextStyle:
                        CustomTextStyles.titleMediumPrimaryContainer,
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment_screen');
                    },
                  ),
                  //SizedBox(height: 40.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_edit_profile".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVuesaxLinearMore,
          margin: EdgeInsets.only(right: 31.h),
        )
      ],
    );
  }

  Widget _buildTopNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          // CustomIconButton(
          //   height: 40.h,
          //   width: 40.h,
          //   padding: EdgeInsets.all(8.h),
          //   decoration: IconButtonStyleHelper.outline,
          //   onTap: () {
          //     onTapBtnArrowleftone(context);
          //   },
          //   child: CustomImageView(
          //     imagePath: ImageConstant.imgArrowLeft,),
          // )
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/myprofile_screen');
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 35.h,
              width: 35.h,
              fit: BoxFit.contain,
            ),
          ),

        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_username".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          BlocSelector<EditprofileBloc, EditprofileState,
              TextEditingController?>(
            selector: (state) => state.userNameController,
            builder: (context, userNameController) {
              return CustomTextFormField(
                controller: userNameController,
                hintText: "lbl_name".tr,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.h, 10.h, 10.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLock,
                    height: 22.h,
                    width: 20.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 44.h,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email".tr,
            style: theme.textTheme.titleMedium,
          ),
          BlocSelector<EditprofileBloc, EditprofileState,
              TextEditingController?>(
            selector: (state) => state.emailtwoController,
            builder: (context, emailtwoController) {
              return CustomTextFormField(
                controller: emailtwoController,
                hintText: "msg_mail".tr,
                textInputType: TextInputType.emailAddress,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.h, 10.h, 10.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgEmail,
                    height: 22.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                validator: (value) {
                  // if (value == null ||
                  //     (!isValidEmail (value, isRequired: true))) {
                  //   return "err_msg_please_enter_valid_email".tr;
                  // }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_phone_number".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 2.h),
          BlocSelector<EditprofileBloc, EditprofileState,
              TextEditingController?>(
            selector: (state) => state.phoneNumberController,
            builder: (context, phoneNumberController) {
              return CustomTextFormField(
                controller: phoneNumberController,
                hintText: "lbl_phone".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.phone,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.h, 10.h, 10.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPhone,
                    height: 22.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                validator: (value) {
                  // if (!isValidPhone (value)) {
                  //   return "err_msg_please_enter_valid_phone_number".tr;
                  // }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapBtnArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
