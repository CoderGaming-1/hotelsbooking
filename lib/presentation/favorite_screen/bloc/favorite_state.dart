part of 'favorite_bloc.dart';
/// Represents the state of Favorite in the application.
// ignore_for_file: must_be_immutable
class FavoriteState extends Equatable {
  FavoriteState({this.searchController, this.favoriteModelObj});

  TextEditingController? searchController;
  FavoriteModel? favoriteModelObj;

  @override
  List<Object?> get props => [searchController, favoriteModelObj];

  FavoriteState copywith({
    TextEditingController? searchController,
    FavoriteModel? favoriteModelObj,
  }) {
    return FavoriteState(
      searchController: searchController ?? this.searchController,
      favoriteModelObj: favoriteModelObj ?? this.favoriteModelObj,
    );
  }
}