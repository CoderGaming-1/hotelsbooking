import 'dart:convert';

import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/search_inf_model.dart';
import 'package:http/http.dart';

class ApiServices{
  final String baseUrl = SharedPreferencesHelper.getAPI();

  Future<List<String>?> searchHotelsServices(SearchInfModel searchInfModel) async{
    final url = Uri.parse('${baseUrl}/api/rooms/search');

    try{
      final response = await post(
        url,
        body: {
          'location': searchInfModel.location,
          'checkInDate': searchInfModel.startDate,
          'checkOutDate': searchInfModel.endDate,
          'guests': searchInfModel.guests,
        }
      );
      print(jsonDecode(response.body.toString()));
      print(response.statusCode.toString() + '12a3');
      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        return (jsonData['data'] as List)
            .map((room) => room['hotel'].toString())
            .toList();
      }
    } catch (e) { }
    return null;
  }

}