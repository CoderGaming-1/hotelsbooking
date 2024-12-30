import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/bookinglistsection_item_model.dart';
import '../../../core/utils/shared_preferences_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookinglistsectionItemWidget extends StatelessWidget {
  BookinglistsectionItemWidget(this.bookinglistsectionItemModelObj, {Key? key})
      : super(key: key);

  final BookinglistsectionItemModel bookinglistsectionItemModelObj;
  String? baseUrl = SharedPreferencesHelper.getAPI();
  // Fetch hotel data (static API example)
  Future<List<Map<String, String>>> fetchRoomAndHotelIds() async {
    String? token = await SharedPreferencesHelper.getToken();
    String? baseUrl = SharedPreferencesHelper.getAPI();
    if (token == null) {
      throw Exception("Token not found. Please log in first.");
    }

    final String apiUrl = "$baseUrl/api/transaction/customer";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['success'] == true) {
        final List<dynamic> transactions = responseData['data'];
        List<Map<String, String>> roomAndHotelIds = [];

        for (var transaction in transactions) {
          if (transaction.containsKey('roomId') && transaction['roomId'] != null) {
            var roomIdData = transaction['roomId'];

            if (roomIdData.containsKey('_id') &&
                roomIdData.containsKey('hotel') &&
                roomIdData['hotel'] != null &&
                roomIdData['hotel'].containsKey('_id')) {
              String roomId = roomIdData['_id'];
              String hotelId = roomIdData['hotel']['_id'];

              roomAndHotelIds.add({
                'roomId': roomId,
                'hotelId': hotelId,
                'checkInDate': transaction['checkInDate'],
                'checkOutDate': transaction['checkOutDate'],
              });
              print("Room ID: $roomId, Hotel ID: $hotelId");
            }
          }
        }

        return roomAndHotelIds;
      } else {
        throw Exception("API responded with an error: ${responseData['message']}");
      }
    } else {
      throw Exception("HTTP error: ${response.statusCode} - ${response.body}");
    }
  }

  Future<Map<String, dynamic>> fetchHotelDetails(String hotelId) async {
    final String apiUrl = "$baseUrl/api/hotels/detailhotel/$hotelId";
    final response = await http.get(Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        print("Fetched hotel details for Hotel ID: $hotelId");
        print("Hotel Data: ${responseData['data']}");
        return responseData['data'];
      } else {
        throw Exception("API responded with an error: ${responseData['message']}");
      }
    } else {
      throw Exception("HTTP error: ${response.statusCode} - ${response.body}");
    }
  }
  Future<Map<String, dynamic>> fetchRoomDetails(String roomId) async {
    final String apiUrl = "$baseUrl/api/rooms/detailroom/$roomId";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        print("Fetched room details for Room ID: $roomId");
        print("Room Data: ${responseData['data']}");
        return responseData['data'];
      } else {
        throw Exception("API responded with an error: ${responseData['message']}");
      }
    } else {
      throw Exception("HTTP error: ${response.statusCode} - ${response.body}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchRoomAndHotelIds(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No bookings found."));
        }

        // Fetch hotel details for each hotelId
        final roomAndHotelIds = snapshot.data!;
        return FutureBuilder<List<Widget>>(
          future: fetchHotelWidgets(roomAndHotelIds),
          builder: (context, hotelWidgetSnapshot) {
            if (hotelWidgetSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (hotelWidgetSnapshot.hasError) {
              return Center(child: Text("Error: ${hotelWidgetSnapshot.error}"));
            }

            final hotelWidgets = hotelWidgetSnapshot.data ?? [];
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                color: appTheme.blueGray400.withOpacity(0.2),
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: hotelWidgets,
              ),
            );
          },
        );
      },
    );
  }
  Future<List<Widget>> fetchHotelWidgets(List<Map<String, String>> roomAndHotelIds) async {
    List<Future<Widget>> hotelWidgetFutures = [];

    for (var entry in roomAndHotelIds) {
      hotelWidgetFutures.add(
        fetchRoomDetails(entry['roomId']!).then((roomDetails) async {
          final String hotelId = entry['hotelId']!;
          final Map<String, dynamic> hotelDetails = await fetchHotelDetails(hotelId);

          final String hotelName = hotelDetails['name'] ?? "Unknown Hotel";
          final String location =
              "${hotelDetails['location']['city']}, ${hotelDetails['location']['country']}";

          // Fetch price from the room details
          final int price = roomDetails['price'] ?? 0; // Use price from roomDetails

          final List<dynamic> mediaList = hotelDetails['media'] ?? [];
          final String media = mediaList.isNotEmpty
              ? mediaList.first.toString()
              : "No Picture available";
          final String mediaUrl = "$baseUrl$media";

          String checkInDate = entry['checkInDate']!.split('T').first;
          String checkOutDate = entry['checkOutDate']!.split('T').first;

          // Print the values to debug
          print("Debug Values:");
          print("imagePath: $mediaUrl");
          print("title: $hotelName");
          print("location: $location");
          print("price: ${price.toString()} VND");
          print("checkInDate: $checkInDate");
          print("checkOutDate: $checkOutDate");
          print("Media : $mediaUrl");

          return _buildHotelItem(
            imagePath: mediaUrl,
            title: hotelName,
            location: location,
            price: "${price.toString()} VND",
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
          );
        }).catchError((e) {
          print("Error fetching hotel details: $e");
          return Center(child: Text("Error fetching hotel details."));
        }),
      );
    }

    return Future.wait(hotelWidgetFutures);
  }




  Widget _buildHotelItem({
    required String imagePath,
    required String title,
    required String location,
    required String price,
    required String checkInDate,
    required String checkOutDate,
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
                                  bookinglistsectionItemModelObj.fifty!,
                                  style: CustomTextStyles.labelMediumPlusJakartaSansAmberA200,
                                ),
                                SizedBox(width: 4.h),
                                Text(
                                  bookinglistsectionItemModelObj.fourhundredsixt!,
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
                    style: CustomTextStyles.labelLargePlusJakartaSansGray800,
                  ),
                  Text(
                    checkInDate,
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
                    "lbl_check_out".tr,
                    style: CustomTextStyles.labelLargePlusJakartaSansGray800,
                  ),
                  Text(
                    checkOutDate,
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
