import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_initial_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/hotellist_item_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'home_one_event.dart';

part 'home_one_state.dart';

/// A bloc that manages the state of a HomeOne according to the event that is dispatched to it.
class HomeOneBloc extends Bloc<HomeOneEvent, HomeOneState> {
  HomeOneBloc(HomeOneState initialState) : super(initialState) {
    on<HomeOneInitialEvent>(_onInitialize);
    on<onSelected>(_onSelected);
  }

  _onSelected(
    onSelected event,
    Emitter<HomeOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }
  Future<List<dynamic>> fetchHotels() async {
    String? baseUrl = SharedPreferencesHelper.getAPI();
    final String apiUrl = '${baseUrl}/api/hotels/all'; // URL API
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Decode JSON response
        final data = jsonDecode(response.body);
        print(data);
        return data; // Giả sử danh sách khách sạn nằm trong `hotels`
      } else {
        throw Exception('Failed to load hotels: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching hotels: $e');
      return [];
    }
  }
  late Future<List<dynamic>> hotels = fetchHotels();
  _onInitialize(
      HomeOneInitialEvent event,
      Emitter<HomeOneState> emit,
      ) async {
    emit(state.copyWith(searchController: TextEditingController()));

    try {
      List<dynamic> fetchedHotels = await fetchHotels();
      String? baseUrl = SharedPreferencesHelper.getAPI();
      List<HotellistItemModel> hotelItems = fetchedHotels.map((hotel) {
        return HotellistItemModel(
          dayOne: '$baseUrl/uploads/hotel/67712cbab2a6de401866187e/1735492379659-291985175-img_1.jfif', // Dùng hình ảnh mặc định
          price: "\$38/Day", // Thay đổi nếu API trả giá
          dayThree: ImageConstant.imgHeart,
          fifty: hotel['rating'].toString(), // Lấy từ API
          fourhundredsixt: "(463)", // Thay đổi nếu API trả đánh giá
          theastonvil: hotel['name'], // Tên khách sạn từ API
          streetromeny: "${hotel['location']['city']}, ${hotel['location']['country']}", // Địa điểm từ API
          id: hotel['_id'],
        );
      }).toList();

      emit(state.copyWith(
        homeOneInitialModelObj: state.homeOneInitialModelObj?.copyWith(
          hotellistItemList: hotelItems,
        ),
      ));
    } catch (e) {
      print("Error fetching hotels: $e");
      // Xử lý lỗi nếu cần
    }
  }

}
