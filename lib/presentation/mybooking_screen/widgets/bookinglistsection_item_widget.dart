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
    final String apiUrl = "${baseUrl}/api/hotels/detailhotel/$hotelId";
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
    List<Widget> hotelWidgets = [];
    for (var entry in roomAndHotelIds) {
      try {
        final hotelDetails = await fetchHotelDetails(entry['hotelId']!);
        final String hotelName = hotelDetails['name'] ?? "Unknown Hotel";
        final String location = "${hotelDetails['location']['city']}, ${hotelDetails['location']['country']}";
        final int price = hotelDetails['rooms'][0]['price'] ?? 0;

        String checkInDate = entry['checkInDate']!.split('T').first;
        String checkOutDate = entry['checkOutDate']!.split('T').first;

        hotelWidgets.add(
          _buildHotelItem(
            imagePath: bookinglistsectionItemModelObj.imageOne ?? ImageConstant.img_1,
            title: hotelName,
            location: location,
            price: "\$${price.toString()}",
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
          ),
        );
      } catch (e) {
        // Handle errors for individual hotels (e.g., API failure)
        print("Error fetching hotel details: $e");
      }
    }
    return hotelWidgets;
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

// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../models/bookinglistsection_item_model.dart';
//
// // ignore_for_file: must_be_immutable
// class BookinglistsectionItemWidget extends StatelessWidget {
//   BookinglistsectionItemWidget(this.bookinglistsectionItemModelObj, {Key? key})
//       : super(
//     key: key,
//   );
//
//   BookinglistsectionItemModel bookinglistsectionItemModelObj;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(
//         horizontal: 18.h,
//         vertical: 14.h,
//       ),
//       decoration: BoxDecoration(
//         color: appTheme.blueGray400.withOpacity(0.1),
//         borderRadius: BorderRadiusStyle.roundedBorder16,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildHotelItem(
//             imagePath: ImageConstant.img_3,
//             title: "Hotel Ringle Belt",
//             location: "120 Washinton D.C, NT 124/22",
//             price: "\$55",
//           ),
//           SizedBox(height: 16.h),
//           _buildHotelItem(
//             imagePath: ImageConstant.img_6,
//             title: "Hotels Chaos Ordering",
//             location: "507 University St, Endicolt",
//             price: "\$90",
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHotelItem({
//     required String imagePath,
//     required String title,
//     required String location,
//     required String price,
//   }) {
//     return Column(
//       children: [
//         SizedBox(
//           width: double.maxFinite,
//           child: Row(
//             children: [
//               CustomImageView(
//                 imagePath: imagePath,
//                 height: 80.h,
//                 width: 80.h,
//                 radius: BorderRadius.circular(8.h),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: double.maxFinite,
//                     margin: EdgeInsets.only(bottom: 4.h),
//                     padding: EdgeInsets.symmetric(horizontal: 16.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: CustomTextStyles
//                               .labelLargePoppinsBlack90001SemiBold_1,
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           location,
//                           style: CustomTextStyles.labelMediumBlack90001,
//                         ),
//                         SizedBox(height: 8.h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: price,
//                                     style: CustomTextStyles
//                                         .labelMediumCyan600,
//                                   ),
//                                   TextSpan(
//                                     text: "lbl_night".tr,
//                                     style: CustomTextStyles
//                                         .labelMediumBlack90001_1,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 CustomImageView(
//                                   imagePath:
//                                   bookinglistsectionItemModelObj.imageOne!,
//                                   height: 14.h,
//                                   width: 14.h,
//                                 ),
//                                 SizedBox(width: 4.h),
//                                 Text(
//                                   bookinglistsectionItemModelObj.fifty!,
//                                   style: CustomTextStyles
//                                       .labelMediumPlusJakartaSansAmberA200,
//                                 ),
//                                 SizedBox(width: 4.h),
//                                 Text(
//                                   bookinglistsectionItemModelObj
//                                       .fourhundredsixt!,
//                                   style: CustomTextStyles
//                                       .labelMediumPlusJakartaSansBluegray400Bold,
//                                 ),
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 4.h),
//           padding: EdgeInsets.symmetric(
//             horizontal: 32.h,
//             vertical: 10.h,
//           ),
//           decoration: BoxDecoration(
//             color: appTheme.whiteA700,
//             borderRadius: BorderRadiusStyle.roundedBorder20,
//           ),
//           width: double.maxFinite,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "lbl_check_in".tr,
//                     style: CustomTextStyles
//                         .labelLargePlusJakartaSansBlack90001,
//                   ),
//                   Text(
//                     "lbl_12_june".tr,
//                     style: theme.textTheme.titleSmall,
//                   ),
//                 ],
//               ),
//               CustomImageView(
//                 imagePath: ImageConstant.imgArrowRight,
//                 height: 24.h,
//                 width: 24.h,
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "Check out\n",
//                     style: CustomTextStyles
//                         .labelLargePlusJakartaSansBlack90001,
//                   ),
//                   Text(
//                     "15 June",
//                     style: theme.textTheme.titleSmall,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
