import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/bookinglistsection_item_model.dart';
import '../models/mybooking_model.dart';
import '../models/mybookinghistor_tab_model.dart';
part 'mybooking_event.dart';
part 'mybooking_state.dart';

/// A bloc that manages the state of a Mybooking according to the event that is dispatched to it.
class MybookingBloc extends Bloc<MybookingEvent, MybookingState> {
  MybookingBloc(MybookingState initialstate) : super(initialstate) {
    on<MybookingInitialEvent>(_onInitialize);
  }
  _onInitialize(
    MybookingInitialEvent event,
    Emitter<MybookingState> emit,
  ) async {
    emit(
      state.copywith(
        mybookinghistorTabModelObj: state.mybookinghistorTabModelObj?.copywith(
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
          fourhundredsixt: "(463)"),
    ];
  }
}
