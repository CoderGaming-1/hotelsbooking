import 'dart:core';

import 'package:hotelsbooking/presentation/search_hotel_screen/models/search_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/services/api_services.dart';

class HotelInfModel {
  String? id;
  String? nameHotel;
  String? rating;
  String? location;
  String? imgHotelUrl;

  HotelInfModel(
      this.id, this.nameHotel, this.rating, this.location, this.imgHotelUrl);
}

