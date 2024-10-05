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
  HomeOneBloc (HomeOneState initialState): super(initialState) {
    on<HomeOneInitialEvent>(_onInitialize);
    on<onSelected>(_onSelected);
  }
  _onSelected(
      onSelected event,
      Emitter<HomeOneState> emit,
      ){
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
          dayOne: ImageConstant.imgImage3,
          dayThree: ImageConstant.imgHeart,
          fifty: "4.9",
          fourhundredsixt: "(364)",
          theastonvil: "STANZA LIVING HOSTEL",
          streetromeny: "StreetRome, NY 13440")
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