import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/from_details_model.dart';

part 'from_details_event.dart';

part 'from_details_state.dart';

/// A bloc that manages the state of a FromDetails according to the event that is dispatched to it.
class FromDetailsBloc extends Bloc<FromDetailsEvent, FromDetailsState> {
  FromDetailsBloc(FromDetailsState initialState) : super(initialState) {
    on<FromDetailsInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeDateEvent>(_changeDate);
  }

  _onInitialize(
    FromDetailsInitialEvent event,
    Emitter<FromDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        dateController: TextEditingController(),
        phoneController: TextEditingController(),
        hotelUpdatesCheckbox: false,
        emailUpdatesCheckbox: false,
        termsOfServiceCheckbox: false,
      ),
    );
    emit(
      state.copyWith(
        fromDetailsModelObj: state.fromDetailsModelObj?.copyWith(
          dropdownItemList: fillDropdownItemList(),
          dropdownItemList1: fillDropdownItemList1(),
        ),
      ),
    );
    // Future.delayed (const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed (AppRoutes.checkoutScreen,);
    // });
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<FromDetailsState> emit,
  ) {
    emit(state.copyWith(
      hotelUpdatesCheckbox: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<FromDetailsState> emit,
  ) {
    emit(state.copyWith(
      emailUpdatesCheckbox: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<FromDetailsState> emit,
  ) {
    emit(state.copyWith(
      termsOfServiceCheckbox: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "1",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "2",
      ),
      SelectionPopupModel(
        id: 3,
        title: "3",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Queen",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "King",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Deluxe",
      )
    ];
  }

  _changeDate(
    ChangeDateEvent event,
    Emitter<FromDetailsState> emit,
  ) {
    emit(state.copyWith(
        fromDetailsModelObj: state.fromDetailsModelObj?.copyWith(
      selectedDate: event.date,
    )));
  }
}
