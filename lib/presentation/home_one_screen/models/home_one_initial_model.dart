import 'package:equatable/equatable.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'hotellist_item_model.dart';
/// This class is used in the [home_one_initial_page] screen.
// ignore_for_file: must_be_immutable
class HomeOneInitialModel extends Equatable {
  HomeOneInitialModel(
      {this.dropdownItemList = const [], this.hotellistItemList = const []});
  List <SelectionPopupModel> dropdownItemList;
  List <HotellistItemModel> hotellistItemList;
  HomeOneInitialModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List <HotellistItemModel>? hotellistItemList,
  }) {
    return HomeOneInitialModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      hotellistItemList: hotellistItemList ?? this.hotellistItemList,
    );
  }
  @override
  List<Object?> get props => [dropdownItemList, hotellistItemList];
}