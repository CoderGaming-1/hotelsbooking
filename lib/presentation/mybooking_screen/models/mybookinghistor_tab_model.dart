import 'package:equatable/equatable.dart';
import 'bookinglistsection_item_model.dart';
/// This class is used in the [mybookinghistor_tab_page] screen.
// ignore_for_file: must_be_immutable
class MybookinghistorTabModel extends Equatable {
  MybookinghistorTabModel({this.bookinglistsectionItemList = const []});
  List<BookinglistsectionItemModel> bookinglistsectionItemList;
  MybookinghistorTabModel copywith(
      {List<BookinglistsectionItemModel>? bookinglistsectionItemList}) {
    return MybookinghistorTabModel(
      bookinglistsectionItemList:
      bookinglistsectionItemList ?? this.bookinglistsectionItemList,
    );
  }
  @override
  List<Object?> get props => [bookinglistsectionItemList];
}