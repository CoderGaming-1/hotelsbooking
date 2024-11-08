import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/favorite_model.dart';
import '../models/favoritegrid_item_model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

/// A bloc that manages the state of a Favorite according to the event that is
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState) {
    on<FavoriteInitialEvent>(_onInitialize);
  }
  _onInitialize(
    FavoriteInitialEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(
      state.copywith(
        searchController: TextEditingController(),
      ),
    );
    emit(
      state.copywith(
        favoriteModelObj: state.favoriteModelObj?.copywith(
          favoritegridItemList: fillFavoritegridItemList(),
        ),
      ),
    );
  }

  List<FavoritegridItemModel> fillFavoritegridItemList() {
    return [
      FavoritegridItemModel(
          muongthanh: "Muong Thanh Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      FavoritegridItemModel(
          muongthanh: "Light Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      FavoritegridItemModel(
          muongthanh: "DaNang SAC Hotel",
          alicesprings: "Alice Springs NT 0870, Australia"),
      FavoritegridItemModel(
          muongthanh: "TS Hotel",
          alicesprings: "Alice Springs NT 0870, Australia")
    ];
  }
}
