import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/bookinglistsection_item_model.dart';
import '../models/mybooking_model.dart';
import '../models/mybookinghistor_tab_model.dart';
import '../models/mybookingbooked_tab_model.dart';
part 'mybooking_event.dart';
part 'mybooking_state.dart';

/// A bloc that manages the state of a Mybooking according to the event that is dispatched to it.
class MybookingBloc extends Bloc<MybookingEvent, MybookingState> {
  MybookingBloc(MybookingState initialState) : super(initialState) {
    on<MybookingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MybookingInitialEvent event,
    Emitter<MybookingState> emit,
  ) async {
    emit(
      state.copyWith(

        mybookingbookedTabModelObj: state.mybookingbookedTabModelObj?.copyWith(
          bookinglistsectionItemList: fillBookinglistsectionItemList(),
        ), // Initialize booked tab model
        mybookinghistorTabModelObj: state.mybookinghistorTabModelObj?.copyWith(
          bookinglistsectionItemList: fillBookinglistsectionItemList(),
        ),
      ),
    );
  }

  List<BookinglistsectionItemModel> fillBookinglistsectionItemList() {
    return [
      BookinglistsectionItemModel(
          imageOne: ImageConstant.imgAntDesignStarFilled,
          fifty: "5.0",
          fourhundredsixt: "(463)",
          // id: "1",
      ),
      BookinglistsectionItemModel(
          imageOne: ImageConstant.imgAntDesignStarFilled,
          fifty: "5.0",
          fourhundredsixt: "(463)",
          // id: "2",
      ),
    ];
  }
}
