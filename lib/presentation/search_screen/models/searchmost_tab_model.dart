import 'package:equatable/equatable.dart';
import 'hotelgrid_item_model.dart';

/// This class is used in the [searchmost_tab_page] screen.
// ignore_for_file: must_be_immutable
class SearchmostTabModel extends Equatable {
  SearchmostTabModel({this.hotelgridItemList = const []});

  List<HotelgridItemModel> hotelgridItemList;

  SearchmostTabModel copywith({List<HotelgridItemModel>? hotelgridItemList}) {
    return SearchmostTabModel(
      hotelgridItemList: hotelgridItemList ?? this.hotelgridItemList,
    );
  }

  @override
  List<Object?> get props => [hotelgridItemList];
}
