import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/checkout_model.dart';
import '../models/checkout_three_item_model.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';
/// A bloc that manages the state of a Checkout according to the event that is dispatched to it.
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
CheckoutBloc (CheckoutState initialState): super(initialState) {
on<CheckoutInitialEvent>(_onInitialize);
}
  _onInitialize(
    CheckoutInitialEvent event,
    Emitter<CheckoutState> emit,
      ) async {
    emit(
      state.copywith(
        checkoutModelObj: state.checkoutModelObj?.copyWith(
          checkoutThreeItemList: fillCheckoutThreeItemList(),
        ),
      ),
    );
  }
List<CheckoutThreeItemModel> fillCheckoutThreeItemList() {
    return [
    CheckoutThreeItemModel(
        dateOne: ImageConstant.imgCalendarmonth,
      datesTwo: "Dates",
      nov2024: "12-15 Nov 2024"),
    CheckoutThreeItemModel(
        dateOne: ImageConstant.imgPersonoutline,
      datesTwo: "Guest",
      nov2024: "2 Guest (1 Room)"),
    CheckoutThreeItemModel(
        dateOne: ImageConstant.imgMeetingroom,
      datesTwo: "Room type",
      nov2024: "Queen Room"),
    CheckoutThreeItemModel(
        dateOne: ImageConstant.imgPhone,
      datesTwo: "Phone",
      nov2024: "0876556478")
    ];
    }
    }