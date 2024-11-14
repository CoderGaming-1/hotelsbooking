import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/filter_model.dart';
import '../models/filter_one_item_model.dart';

part 'filter_event.dart';

part 'filter_state.dart';

/// A bloc that manages the state of a Filter according to the event that is dispatched to it.
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc(FilterState initialState) : super(initialState) {
    on<FilterInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    // on<UpdatePriceRangeEvent>((event, emit) {
    //   emit(state.copyWith(priceRange: event.newRange));
    // });
  }


  _onInitialize(
    FilterInitialEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(
      state.copyWith(
        wifiCheckbox: false,
        tvCheckbox: false,
        poolCheckbox: false,
        laundryCheckbox: false,
      ),
    );
    emit(
      state.copyWith(
        filterModelObj: state.filterModelObj?.copyWith(
          dropdownItemList: fillDropdownItemList(),
          filterOneItemList: fillFilterOneItemList(),
        ),
      ),
    );
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      wifiCheckbox: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      tvCheckbox: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      poolCheckbox: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(
      laundryCheckbox: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "2 Guest(2 Adult)",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "1 Guest(1 Adult)",
      ),
      SelectionPopupModel(
        id: 3,
        title: "4 Guest(2 Adult, 2 Children)",
      )
    ];
  }

  List<FilterOneItemModel> fillFilterOneItemList() {
    return [
      FilterOneItemModel(five: "5"),
      FilterOneItemModel(five: "4"),
      FilterOneItemModel(five: "3"),
      FilterOneItemModel(five: "2"),
      FilterOneItemModel(five: "1")
    ];
  }
}
