import 'dart:convert';

import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/hotel_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/search_inf_model.dart';
import 'package:http/http.dart';

class ApiServices {
  final String baseUrl = SharedPreferencesHelper.getAPI();

  Future<List<HotelInfModel>?> searchHotelsServices(
      SearchInfModel searchInfModel) async {
    final url = Uri.parse('${baseUrl}/api/hotels/search');
    print( searchInfModel.location);
    print(searchInfModel.startDate);
    print(  searchInfModel.endDate);
    try {
      final response = await post(url, body: {
        'location': "Đà Nẵng",
        'checkInDate': searchInfModel.startDate,
        'checkOutDate': searchInfModel.endDate,
        'guests': searchInfModel.guests.toString(),
      });
      print(jsonDecode(response.body.toString()));
      print(response.statusCode.toString() + '12a3');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List hotelsData = jsonData['data'];
        print("1");
        print(hotelsData);
        List<HotelInfModel> hotels = [];
        for (var hotel in hotelsData) {
          if (hotel.containsKey('hotel')) {
            hotels.add(HotelInfModel.fromJson(hotel));
          } else {
            print('Key "hotel" not found in: $hotel');
          }
        }
        print("hoang");
        print(hotels);
        return hotels;
      } else {
        return null; // Xử lý các mã lỗi khác nếu cần
      }
    } catch (e) {}
    return null;
  }
}
