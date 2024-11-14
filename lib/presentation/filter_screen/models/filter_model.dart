import 'package:equatable/equatable.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'filter_one_item_model.dart';

/// This class defines the variables used in the [filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class FilterModel extends Equatable {
  FilterModel(
      {
        this.dropdownItemList = const [],
        this.filterOneItemList = const []});

  List<SelectionPopupModel> dropdownItemList;
  List<FilterOneItemModel> filterOneItemList;

  FilterModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<FilterOneItemModel>? filterOneItemList,
  }) {
    return FilterModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      filterOneItemList: filterOneItemList ?? this.filterOneItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, filterOneItemList];
}
