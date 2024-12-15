import 'package:flutter/material.dart';
import 'package:hotelsbooking/theme/custom_button_style.dart';
import '../../core/app_export.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/from_details_bloc.dart';
import 'models/from_details_model.dart';

// ignore_for_file: must_be_immutable
class FromDetailsScreen extends StatelessWidget {
  FromDetailsScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FromDetailsBloc>(
      create: (context) => FromDetailsBloc(FromDetailsState(
        fromDetailsModelObj: FromDetailsModel(),
      ))
        ..add(FromDetailsInitialEvent()),
      child: FromDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), // Back icon
            onPressed: () {
              Navigator.pop(context); // Navigates to the previous screen
            },
          ),
          title: Text(
            'From Detail',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formkey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 22.h,
                  top: 22.h,
                  right: 22.h,
                ),
                child: Column(
                  children: [
                    _buildDateSelection(context),
                    SizedBox(height: 18.h),
                    _buildGuestSelection(context),
                    SizedBox(height: 18.h),
                    _buildRoomTypeSelection(context),
                    SizedBox(height: 18.h),
                    _buildPhoneNumberInput(context),
                    SizedBox(height: 42.h),
                    _buildHotelUpdatesCheckbox(context),
                    _buildEmailUpdatesCheckbox(context),
                    _buildTermsOfServiceCheckbox(context),
                    SizedBox(height: 26.h)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildContinueButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopNavigation(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 65.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 25.h,
          top: 8.h,
          bottom: 8.h,
        ),
        onTap: () {
          // Optionally, you can handle additional logic here
          Navigator.pushNamed(context, '/detail_screen');
        },
      ),

      centerTitle: true,
      title: Text("lbl_from_detail".tr,
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold),),
    );
  }

  /// Section Widget
  Widget _buildDateSelection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_dates".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          BlocSelector<FromDetailsBloc, FromDetailsState,
              TextEditingController?>(
            selector: (state) => state.dateController,
            builder: (context, dateController) {
              return CustomTextFormField(
                readonly: true,
                controller: dateController,
                hintText: "lbl_select_date".tr,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 12.h, 10.h, 12.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCalendarmonth,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                suffix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.h, 12.h, 12.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdown,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.all(12.h),
                onTap: () {
                  onTapDate(context);
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGuestSelection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_guests".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          BlocSelector<FromDetailsBloc, FromDetailsState, FromDetailsModel?>(
            selector: (state) => state.fromDetailsModelObj,
            builder: (context, fromDetailsModelObj) {
              return CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.only(left: 16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdown,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                iconSize: 24.h,
                hintText: "msg_select_number_of".tr,
                items: fromDetailsModelObj?.dropdownItemList ?? [],
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 12.h, 10.h, 12.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPersonoutline,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRoomTypeSelection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_room_type".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          BlocSelector<FromDetailsBloc, FromDetailsState, FromDetailsModel?>(
            selector: (state) => state.fromDetailsModelObj,
            builder: (context, fromDetailsModelObj) {
              return CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.only(left: 16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdown,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                iconSize: 24.h,
                hintText: "msg_select_room_type".tr,
                items: fromDetailsModelObj?.dropdownItemList1 ?? [],
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 12.h, 10.h, 12.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMeetingroom,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInput(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_number_phone".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          BlocSelector<FromDetailsBloc, FromDetailsState,
              TextEditingController?>(
            selector: (state) => state.phoneController,
            builder: (context, phoneController) {
              return CustomTextFormField(
                controller: phoneController,
                hintText: "msg_your_phone_number".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.phone,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 12.h, 10.h, 12.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPhone,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.all(12.h),

                // validator: (value) {
                // if (!isValidPhone (value)) {
                // return "err_msg_please_enter_valid_phone_number".tr;
                // }
                // return null;
                // },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHotelUpdatesCheckbox(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BlocSelector<FromDetailsBloc, FromDetailsState, bool?>(
        selector: (state) => state.hotelUpdatesCheckbox,
        builder: (context, hotelUpdatesCheckbox) {
          return CustomCheckboxButton(
            text: "msg_keep_me_update_on".tr,
            isExpandedText: true,
            value: hotelUpdatesCheckbox,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 4.h,
            ),
            decoration: CustomCheckBoxStyleHelper.fillPrimaryContainer,
            onChange: (value) {
              context
                  .read<FromDetailsBloc>()
                  .add(ChangeCheckBoxEvent(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailUpdatesCheckbox(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BlocSelector<FromDetailsBloc, FromDetailsState, bool?>(
        selector: (state) => state.emailUpdatesCheckbox,
        builder: (context, emailUpdatesCheckbox) {
          return CustomCheckboxButton(
            text: "msg_send_me_emails_about".tr,
            isExpandedText: true,
            value: emailUpdatesCheckbox,
            padding: EdgeInsets.fromLTRB(12.h, 6.h, 8.h, 6.h),
            decoration: CustomCheckBoxStyleHelper.fillPrimaryContainer,
            onChange: (value) {
              context
                  .read<FromDetailsBloc>()
                  .add(ChangeCheckBox1Event(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTermsOfServiceCheckbox(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BlocSelector<FromDetailsBloc, FromDetailsState, bool?>(
        selector: (state) => state.termsOfServiceCheckbox,
        builder: (context, termsOfServiceCheckbox) {
          return CustomCheckboxButton(
            text: "msg_i_accept_the_apps".tr,
            isExpandedText: true,
            value: termsOfServiceCheckbox,
            padding: EdgeInsets.fromLTRB(12.h, 4.h, 4.h, 4.h),
            decoration: CustomCheckBoxStyleHelper.fillPrimaryContainer,
            onChange: (value) {
              context
                  .read<FromDetailsBloc>()
                  .add(ChangeCheckBox2Event(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            buttonStyle: CustomButtonStyles.onChoose,
            text: "lbl_continue".tr,
            margin: EdgeInsets.only(bottom: 12.h),
            onPressed: () {
              Navigator.pushNamed(context, '/checkout_screen');
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// current [fromDetailsModelObj] object if the user selects a valid date.
  ///
  /// This function returns a Future that completes with "void
  Future<void> onTapDate(BuildContext context) async {
    var initialState = BlocProvider.of<FromDetailsBloc>(context).state;
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      context.read<FromDetailsBloc>().add(ChangeDateEvent(date: dateTime));
      initialState.dateController?.text =
          dateTime.format(pattern: dateTimeFormatPattern);
    }
  }
}
