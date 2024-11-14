part of 'filter_bloc.dart';

/// Represents the state of Filter in the application.
// ignore_for_file: must_be_immutable
class FilterState extends Equatable {


  FilterState(
      {this.selectedDropDownValue,
      this.wifiCheckbox = false,
      this.tvCheckbox = false,
      this.poolCheckbox = false,
      this.laundryCheckbox = false,
      this.filterModelObj});

  SelectionPopupModel? selectedDropDownValue;
  FilterModel? filterModelObj;
  bool wifiCheckbox;
  bool tvCheckbox;
  bool poolCheckbox;
  bool laundryCheckbox;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        wifiCheckbox,
        tvCheckbox,
        poolCheckbox,
        laundryCheckbox,
        filterModelObj
      ];

  FilterState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    bool? wifiCheckbox,
    bool? tvCheckbox,
    bool? poolCheckbox,
    bool? laundryCheckbox,
    FilterModel? filterModelObj,
  }) {
    return FilterState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      wifiCheckbox: wifiCheckbox ?? this.wifiCheckbox,
      tvCheckbox: tvCheckbox ?? this.tvCheckbox,
      poolCheckbox: poolCheckbox ?? this.poolCheckbox,
      laundryCheckbox: laundryCheckbox ?? this.laundryCheckbox,
      filterModelObj: filterModelObj ?? this.filterModelObj,
    );
  }
}
