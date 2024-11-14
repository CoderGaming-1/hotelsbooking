import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/hotelgrid_item_model.dart';
import '../models/search_model.dart';
import '../models/searchmost_tab_model.dart';

part 'search_event.dart';

part 'search_state.dart';

/// A bloc that manages the state of a Search according to the event that is dispatched to it.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SearchInitialEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        searchOneController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        searchmostTabModelObj: state.searchmostTabModelObj?.copywith(
          hotelgridItemList: fillHotelgridItemList(),
        ),
      ),
    );
  }

  List<HotelgridItemModel> fillHotelgridItemList() {
    return [
      HotelgridItemModel(
          muongthanh: "Muong Thanh Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      HotelgridItemModel(
          muongthanh: "Light Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      HotelgridItemModel(
          muongthanh: "DaNang SAC Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      HotelgridItemModel(
          muongthanh: "TS Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      HotelgridItemModel(
          muongthanh: "DaNang SAC Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      HotelgridItemModel(
          muongthanh: "TS Hotel",
          alicesprings: "Alice Springs NT 0870, Australia")
    ];
  }
}
