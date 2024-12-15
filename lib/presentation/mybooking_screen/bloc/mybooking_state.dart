part of 'mybooking_bloc.dart';

/// Represents the state of Mybooking in the application.
// ignore_for_file: must_be_immutable
class MybookingState extends Equatable {
  final MybookingModel? mybookingModelObj;
  final MybookinghistorTabModel? mybookinghistorTabModelObj;
  final MybookingbookedTabModel? mybookingbookedTabModelObj;

  MybookingState({
    this.mybookingModelObj,
    this.mybookinghistorTabModelObj,
    this.mybookingbookedTabModelObj,
  });

  MybookingState copyWith({
    MybookingModel? mybookingModelObj,
    MybookinghistorTabModel? mybookinghistorTabModelObj,
    MybookingbookedTabModel? mybookingbookedTabModelObj,
  }) {
    return MybookingState(
      mybookingModelObj: mybookingModelObj ?? this.mybookingModelObj,
      mybookinghistorTabModelObj: mybookinghistorTabModelObj ?? this.mybookinghistorTabModelObj,
      mybookingbookedTabModelObj: mybookingbookedTabModelObj ?? this.mybookingbookedTabModelObj,
    );
  }

  @override
  List<Object?> get props => [
    mybookingModelObj,
    mybookinghistorTabModelObj,
    mybookingbookedTabModelObj,
  ];
}

