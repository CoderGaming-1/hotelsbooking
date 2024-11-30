import 'package:equatable/equatable.dart';
import 'bookinglistsection_item_model.dart';

class MybookingbookedTabModel extends Equatable {
  MybookingbookedTabModel({this.bookinglistsectionItemList = const []});

  List<BookinglistsectionItemModel> bookinglistsectionItemList;

  MybookingbookedTabModel copyWith(
      {List<BookinglistsectionItemModel>? bookinglistsectionItemList}) {
    return MybookingbookedTabModel(
      bookinglistsectionItemList:
      bookinglistsectionItemList ?? this.bookinglistsectionItemList,
    );
  }

  @override
  List<Object?> get props => [bookinglistsectionItemList];
}
