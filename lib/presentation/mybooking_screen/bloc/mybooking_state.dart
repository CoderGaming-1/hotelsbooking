part of 'mybooking_bloc.dart';

/// Represents the state of Mybooking in the application.
// ignore_for_file: must_be_immutable
class MybookingState extends Equatable {
  MybookingState({this.mybookinghistorTabModelObj, this.mybookingModelObj});

  MybookingModel? mybookingModelObj;
  MybookinghistorTabModel? mybookinghistorTabModelObj;

  @override
  List<Object?> get props => [mybookinghistorTabModelObj, mybookingModelObj];

  MybookingState copywith({
    MybookinghistorTabModel? mybookinghistorTabModelObj,
    MybookingModel? mybookingModelObj,
  }) {
    return MybookingState(
      mybookinghistorTabModelObj:
          mybookinghistorTabModelObj ?? this.mybookinghistorTabModelObj,
      mybookingModelObj: mybookingModelObj ?? this.mybookingModelObj,
    );
  }
}
