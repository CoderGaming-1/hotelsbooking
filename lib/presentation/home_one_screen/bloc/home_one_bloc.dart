import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_initial_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/hotellist_item_model.dart';

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

  List<HotellistItemModel> fillHotellistItemList() {
    return [
      HotellistItemModel(
          dayOne: ImageConstant.imgImageDefaultProperty1,
          price: "\$38/Day",
          dayThree: ImageConstant.imgHeart,
          fifty: "5.0",
          fourhundredsixt: "(463)",
          theastonvil: "The Aston Vil Hotel",
          streetromeny: "StreetRome, NY 13440"),
      HotellistItemModel(
          dayOne: ImageConstant.img1,
          dayThree: ImageConstant.imgHeart,
          fifty: "4.9",
          fourhundredsixt: "(258)",
          theastonvil: "The Grand Palm Resort",
          streetromeny: "50 Seaside Avenue"),
      HotellistItemModel(
          dayOne: ImageConstant.img2,
          dayThree: ImageConstant.imgHeart,
          fifty: "5.0",
          fourhundredsixt: "(356)",
          theastonvil: "Skyline Suites",
          streetromeny: "123 Liberty Street"),
      HotellistItemModel(
          dayOne: ImageConstant.img3,
          dayThree: ImageConstant.imgHeart,
          fifty: "4.9",
          fourhundredsixt: "(583)",
          theastonvil: "Azure Coast Hotel",
          streetromeny: "45 Caldera Road"),
      HotellistItemModel(
          dayOne: ImageConstant.img_1,
          dayThree: ImageConstant.imgHeart,
          fifty: "4.9",
          fourhundredsixt: "(364)",
          theastonvil: "STANZA LIVING HOSTEL",
          streetromeny: "StreetRome, NY 13440"),

      HotellistItemModel(
          dayOne: ImageConstant.img4,
          dayThree: ImageConstant.imgHeart,
          fifty: "4.9",
          fourhundredsixt: "(531)",
          theastonvil: "Mountain Crest Lodge",
          streetromeny: "789 Alpine Drive"),
      HotellistItemModel(
          dayOne: ImageConstant.img5,
          dayThree: ImageConstant.imgHeart,
          fifty: "5.0",
          fourhundredsixt: "(943)",
          theastonvil: "The Heritage Bay Hotel",
          streetromeny: " 250 Harbour Road"),

    ];
  }

  _onInitialize(
    HomeOneInitialEvent event,
    Emitter<HomeOneState> emit,
  ) async {
    emit(
      state.copyWith(
        searchController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        homeOneInitialModelObj: state.homeOneInitialModelObj?.copyWith(
          hotellistItemList: fillHotellistItemList(),
        ),
      ),
    );
  }
}
