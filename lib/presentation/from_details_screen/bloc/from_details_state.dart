part of 'from_details_bloc.dart';
/// Represents the state of FromDetails in the application.
// ignore_for_file: must_be_immutable
class FromDetailsState extends Equatable {
  FromDetailsState(
      {this.dateController,
        this.phoneController,
        this.selectedDropDownValue,
        this.selectedDropDownValue1,
        this.hotelUpdatesCheckbox = false,
        this.emailUpdatesCheckbox = false,
        this.termsOfServiceCheckbox = false,
        this.fromDetailsModelObj
      });
  TextEditingController? dateController;
  TextEditingController? phoneController;
  SelectionPopupModel? selectedDropDownValue;
  SelectionPopupModel? selectedDropDownValue1;
  FromDetailsModel? fromDetailsModelObj;
  bool hotelUpdatesCheckbox;
  bool emailUpdatesCheckbox;
  bool termsOfServiceCheckbox;
  @override
  List<Object?> get props => [
    dateController,
    phoneController,
    selectedDropDownValue,
    selectedDropDownValue1,
    hotelUpdatesCheckbox,
    emailUpdatesCheckbox,
    termsOfServiceCheckbox,
    fromDetailsModelObj ];
  FromDetailsState copyWith({
  TextEditingController? dateController,
  TextEditingController? phoneController,
  SelectionPopupModel? selectedDropDownValue,
  SelectionPopupModel? selectedDropDownValue1,
  bool? hotelUpdatesCheckbox,
  bool? emailUpdatesCheckbox,
  bool? termsOfServiceCheckbox,
  FromDetailsModel? fromDetailsModelObj,
  }) {
  return FromDetailsState(
    phoneController: phoneController ?? this.phoneController,
    dateController: dateController ?? this.dateController,
    selectedDropDownValue: selectedDropDownValue ?? this.selectedDropDownValue,
    selectedDropDownValue1: selectedDropDownValue1 ?? this.selectedDropDownValue1,
    termsOfServiceCheckbox:termsOfServiceCheckbox ?? this.termsOfServiceCheckbox,
    hotelUpdatesCheckbox: hotelUpdatesCheckbox ?? this.hotelUpdatesCheckbox,
    emailUpdatesCheckbox: emailUpdatesCheckbox ?? this.emailUpdatesCheckbox,
    fromDetailsModelObj: fromDetailsModelObj ?? this.fromDetailsModelObj,
    );
}
}