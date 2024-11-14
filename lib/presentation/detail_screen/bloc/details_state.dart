part of 'details_bloc.dart';

/// Represents the state of Details in the application.
// ignore_for file: must_be_immutable
class DetailsState extends Equatable {
  DetailsState({this.breakfastInputController, this.detailsModelObj});

  TextEditingController? breakfastInputController;
  DetailsModel? detailsModelObj;

  @override
  List<Object?> get props => [breakfastInputController, detailsModelObj];

  DetailsState copyWith({
    TextEditingController? breakfastInputController,
    DetailsModel? detailsModelObj,
  }) {
    return DetailsState(
      breakfastInputController:
          breakfastInputController ?? this.breakfastInputController,
      detailsModelObj: detailsModelObj ?? this.detailsModelObj,
    );
  }
}
