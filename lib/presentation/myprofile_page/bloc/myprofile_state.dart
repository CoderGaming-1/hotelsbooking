part of 'myprofile_bloc.dart';

/// Represents the state of Myprofile in the application.
// ignore_for_file: must_be_immutable
class MyprofileState extends Equatable {
  MyprofileState({this.myprofileModelObj});
  MyprofileModel? myprofileModelObj;
  @override
  List<Object?> get props => [myprofileModelObj];
  MyprofileState copywith({MyprofileModel? myprofileModelobj}) {
    return MyprofileState(
      myprofileModelObj: myprofileModelObj ?? this.myprofileModelObj,
    );
  }
}
