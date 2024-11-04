import 'package:equatable/equatable.dart';
/// This class is used in the [favoritegrid_item_widget] screen.
// ignore_for_file: must_be_immutable
class FavoritegridItemModel extends Equatable {
  FavoritegridItemModel({this.muongthanh, this.alicesprings, this.id}) {
    muongthanh = muongthanh ?? "Muong Thanh Hotel";
    alicesprings = alicesprings ?? "Alice Springs NT 0870, Australia";
    id = id ?? "";
  }
  String? muongthanh;
  String? alicesprings;
  String? id;
  FavoritegridItemModel copywith({
    String? muongthanh,
    String? alicesprings,
    String? id,
  }) {
    return FavoritegridItemModel(
      muongthanh: muongthanh ?? this.muongthanh, alicesprings: alicesprings ?? this.alicesprings, id: id ?? this.id,
    );
  }
  @override
  List<Object?> get props => [muongthanh, alicesprings, id];
}