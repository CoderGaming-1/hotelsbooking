import 'package:equatable/equatable.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [from details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class FromDetailsModel extends Equatable {
  FromDetailsModel(
      {this.selectedDate,
      this.date = "\"\"",
      this.dropdownItemList = const [],
      this.dropdownItemList1 = const []}) {
    selectedDate = selectedDate ?? DateTime.now();
  }

  DateTime? selectedDate;
  String date;
  List<SelectionPopupModel> dropdownItemList;
  List<SelectionPopupModel> dropdownItemList1;

  FromDetailsModel copyWith({
    DateTime? selectedDate,
    String? date,
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
  }) {
    return FromDetailsModel(
      selectedDate: selectedDate ?? this.selectedDate,
      date: date ?? this.date,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
    );
  }

  @override
  List<Object?> get props =>
      [selectedDate, date, dropdownItemList, dropdownItemList1];
}
