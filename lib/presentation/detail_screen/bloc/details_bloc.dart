import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/details_model.dart';
import '../models/detailslist_item_model.dart';

part 'details_event.dart';

part 'details_state.dart';

/// A bloc that manages the state of a Details according to the event that is c
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(DetailsState initialState) : super(initialState) {
    on<DetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DetailsInitialEvent event,
    Emitter<DetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        breakfastInputController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        detailsModelObj: state.detailsModelObj?.copyWith(
          detailslistItemList: fillDetailslistItemList(),
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 3000), () {});
  }

  List<DetailslistItemModel> fillDetailslistItemList() {
    return [
      DetailslistItemModel(image: ImageConstant.imgImage9),
      DetailslistItemModel(image: ImageConstant.imgImage982x98),
      DetailslistItemModel(image: ImageConstant.imgImage91)
    ];
  }
}
