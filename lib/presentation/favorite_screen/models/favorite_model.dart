import 'package:equatable/equatable.dart';
import 'favoritegrid_item_model.dart';

/// This class defines the variables used in the [favorite_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class FavoriteModel extends Equatable {
  FavoriteModel({this.favoritegridItemList = const []});

  List<FavoritegridItemModel> favoritegridItemList;

  FavoriteModel copywith({List<FavoritegridItemModel>? favoritegridItemList}) {
    return FavoriteModel(
      favoritegridItemList: favoritegridItemList ?? this.favoritegridItemList,
    );
  }

  @override
  List<Object?> get props => [favoritegridItemList];
}
