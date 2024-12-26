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
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/shared_preferences_helper.dart';
// ignore_for_file: must_be_immutable
class FromDetailsScreen extends StatelessWidget {
  final String roomId; // Declare the roomId variable

  // Add TextEditingController fields
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  // FromDetailsScreen({Key? key}) : super(key: key,);
  FromDetailsScreen({Key? key, required this.roomId}) : super(key: key);
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  String? baseUrl = SharedPreferencesHelper.getAPI();
  static Widget builder(BuildContext context) {
    final roomId = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return BlocProvider<FromDetailsBloc>(
      create: (context) => FromDetailsBloc(FromDetailsState(
        fromDetailsModelObj: FromDetailsModel(),
      ))..add(FromDetailsInitialEvent()),
      child: FromDetailsScreen(roomId: roomId),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("ID room after I get : ${roomId}");
    final fromDetailsBloc = context.read<FromDetailsBloc>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('From Detail',
            style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
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
                    _buildDateSelection(context, true), // For check-in date
                    SizedBox(height: 18.h),
                    _buildDateSelection(context, false), // For check-out date
                    SizedBox(height: 100.h),
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
  Widget _buildDateSelection(BuildContext context, bool isCheckIn) {
    final controller = isCheckIn ? _checkInController : _checkOutController;
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCheckIn ? "lbl_check_in_date".tr : "lbl_check_out_date".tr,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          CustomTextFormField(
            readonly: true,
            controller: controller,
            hintText: isCheckIn
                ? "lbl_select_check_in_date".tr
                : "lbl_select_check_out_date".tr,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(12.h, 12.h, 10.h, 12.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgCalendarmonth,
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixConstraints: BoxConstraints(maxHeight: 48.h),
            suffix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.h, 12.h, 12.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: 48.h),
            contentPadding: EdgeInsets.all(12.h),
            onTap: () {
              onTapDate(context, isCheckIn); // Open date picker
            },
          ),
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
          onPressed: () async {
            String? token = await SharedPreferencesHelper.getToken();
            print("Token : $token");
          if (_checkInDate == null) {
          print("Check-In date is null.");
          return; // Prevent booking
          }
          if (_checkOutDate == null) {
          print("Check-Out date is null.");
          return; // Prevent booking
          }

          print("Check-In Date: $_checkInDate");
          print("Check-Out Date: $_checkOutDate");

          final response = await bookRoom(roomId as String, _checkInDate!, _checkOutDate!);
          if (response != null) {
          print("Booking Successful: $response");
          Navigator.pushNamed(context, '/checkout_screen');
          } else {
          print("Booking Failed: Response is null");
          }
          },

          ),
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
  Future<void> onTapDate(BuildContext context, bool isCheckIn) async {
  DateTime? dateTime = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(1970),
  lastDate: DateTime(DateTime.now().year + 1, 12, 31), // Allow dates up to next year
  );

  if (dateTime != null) {
  String formattedDate =
  "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

  if (isCheckIn) {
  _checkInDate = dateTime; // Assign selected date
  _checkInController.text = formattedDate; // Update controller text
  } else {
  _checkOutDate = dateTime; // Assign selected date
  _checkOutController.text = formattedDate; // Update controller text
  }

  // Debugging output
  print("Selected ${isCheckIn ? 'Check-In' : 'Check-Out'} Date: $formattedDate");
  } else {
  print("Date selection was canceled.");
  }
  }


  Future<Map<String, dynamic>?> bookRoom(String? roomId, DateTime checkInDate, DateTime checkOutDate) async {
    try {
      String? token = await SharedPreferencesHelper.getToken();
      String? baseUrl = SharedPreferencesHelper.getAPI();
      print("Token : $token");
      final response = await http.post(
        Uri.parse("{$baseUrl}/api/reservations/book/$roomId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "checkInDate": "${checkInDate.year}-${checkInDate.month.toString().padLeft(2, '0')}-${checkInDate.day.toString().padLeft(2, '0')}",
          "checkOutDate": "${checkOutDate.year}-${checkOutDate.month.toString().padLeft(2, '0')}-${checkOutDate.day.toString().padLeft(2, '0')}",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

}
