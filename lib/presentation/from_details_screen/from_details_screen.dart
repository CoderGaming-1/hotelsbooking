import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/checkout_screen/checkout_screen.dart';
import 'package:hotelsbooking/presentation/from_details_screen/models/reservation_model.dart';
import 'package:hotelsbooking/theme/custom_button_style.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/from_details_bloc.dart';
import 'models/from_details_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/shared_preferences_helper.dart';

// ignore_for_file: must_be_immutable
class FromDetailsScreen extends StatefulWidget {
  final String roomId;
  final String price; // Declare the roomId variable

  // Add TextEditingController fields
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();

  FromDetailsScreen({Key? key, required this.roomId, required this.price}) : super(key: key);

  @override
  _FromDetailsScreenState createState() => _FromDetailsScreenState();
}
class _FromDetailsScreenState extends State<FromDetailsScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  double totalPrice = 0.0; // Khởi tạo biến tổng giá
  late final ReservationModel reservationModel;

  // Sử dụng TextEditingController từ widget
  late TextEditingController _checkInController;
  late TextEditingController _checkOutController;

  @override
  void initState() {
    super.initState();
    _checkInController = widget._checkInController;
    _checkOutController = widget._checkOutController;
  }

  @override
  void dispose() {
    _checkInController.dispose();
    _checkOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("ID room after I get : ${widget.roomId}");
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
          title: Text(
            'From Detail',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Form(
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
                    SizedBox(height: 420.h),
                    Container(
                      margin: EdgeInsets.only(left: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.h,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "Total Price",
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4.h),
                            child: Text(
                              "VND ${totalPrice.toStringAsFixed(0)}", // Hiển thị giá tổng
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                          )
                        ],
                      ),
                    ),
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
            hintText: isCheckIn ? "lbl_check_in".tr : "lbl_check_out".tr,
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

              final response = await bookRoom(
                  widget.roomId, _checkInDate!, _checkOutDate!);
              print(response);
              if (response != null) {
                print("Booking Successful: $response");
                reservationModel = ReservationModel.fromJson(response['data']);
                showBookingDialog(context);
              } else {
                print("Booking Failed: Response is null");
              }

            },
          ),
        ],
      ),
    );
  }

  Future<void> onTapDate(BuildContext context, bool isCheckIn) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(DateTime.now().year + 1, 12, 31),
    );

    if (dateTime != null) {
      String formattedDate =
          "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

      setState(() {
        if (isCheckIn) {
          _checkInDate = dateTime;
          _checkInController.text = formattedDate;
        } else {
          _checkOutDate = dateTime;
          _checkOutController.text = formattedDate;
        }

        // Tính tổng giá khi cả ngày check-in và check-out đều được chọn
        if (_checkInDate != null && _checkOutDate != null) {
          final duration = _checkOutDate!.difference(_checkInDate!);
          totalPrice = (duration.inDays) * double.parse(widget.price); // Giá mỗi đêm
        }
      });

      // Debugging output
      print("Selected ${isCheckIn ? 'Check-In' : 'Check-Out'} Date: $formattedDate");
    } else {
      print("Date selection was canceled.");
    }
  }

  Future<Map<String, dynamic>?> bookRoom(
      String roomId, DateTime checkInDate, DateTime checkOutDate) async {
    try {
      print(DateFormat('yyyy-MM-dd').format(checkInDate));
      print(DateFormat('yyyy-MM-dd').format(checkOutDate));
      String? token = await SharedPreferencesHelper.getToken();
      String? baseUrl = SharedPreferencesHelper.getAPI();
      print("Token : $token");
      print(roomId);
      final response = await http.post(
        Uri.parse("$baseUrl/api/reservations/book/$roomId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "checkInDate": DateFormat('yyyy-MM-dd').format(checkInDate),
          "checkOutDate": DateFormat('yyyy-MM-dd').format(checkOutDate),
          "paymentMethod": 50
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
  // hiện thị detail booking
  void showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Booking Summary"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Check-in Date: ${_checkInController.text}"),
              Text("Check-out Date: ${_checkOutController.text}"),
              SizedBox(height: 10.h),
              Text("Total Price: ${totalPrice.toStringAsFixed(0)} VND"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await processPayment(context);
              },
              child: Text("Proceed to Payment"),
            ),
          ],
        );
      },
    );
  }

  Future<void> processPayment(BuildContext context) async {
    // Lấy token và reservationId từ đối tượng đặt phòng
    String? token = await SharedPreferencesHelper.getToken();
    String reservationId = reservationModel.id; // Lấy reservationId thực tế từ kết quả đặt phòng

    if (token == null) {
      print("Token is null, can't proceed with payment.");
      return;
    }

    try {
      String? baseUrl = SharedPreferencesHelper.getAPI();
      // Gửi yêu cầu thanh toán
      final response = await http.post(
        Uri.parse("$baseUrl/api/orders/create"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "reservationId": reservationId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Thanh toán thành công
        final responseData = jsonDecode(response.body);
        print("Payment Order Created: $responseData");

        bool success = responseData["success"];
        String? paymentUrl = responseData["paymentUrl"];

        if (success && paymentUrl != null) {
          _launchUri(Uri.parse(paymentUrl));
        } else {
          // Nếu không có paymentUrl hoặc thông báo không thành công
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Payment Error"),
                content: Text("Unable to proceed with payment. Please try again."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Đóng dialog
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Nếu API trả về lỗi
        print("Payment Failed: ${response.body}");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Payment Failed"),
              content: Text("There was an issue with the payment. Please try again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Đóng dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Exception during payment process: $e");

      // Hiển thị lỗi nếu có sự cố trong khi gửi yêu cầu
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while processing your payment. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
  Future<void> _launchUri(Uri _url) async{
    if(!await launchUrl(_url)){
      throw 'Cant open url : $_url ';
    }
  }
}
