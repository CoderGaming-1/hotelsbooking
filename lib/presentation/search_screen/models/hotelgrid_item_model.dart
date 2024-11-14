import 'package:equatable/equatable.dart';

/// This class is used in the [hotelgrid_item_widget] screen.
// ignore_for_file: must_be_immutable
class HotelgridItemModel extends Equatable {
  HotelgridItemModel({this.muongthanh, this.alicesprings, this.id}) {
    muongthanh = muongthanh ?? "Muong Thanh Hotel";
    alicesprings = alicesprings ?? "Alice Springs NT 0870, Australia";
    id = id ?? "";
  }

  String? muongthanh;
  String? alicesprings;
  String? id;

  HotelgridItemModel copyWith({
    String? muongthanh,
    String? alicesprings,
    String? id,
  }) {
    return HotelgridItemModel(
      muongthanh: muongthanh ?? this.muongthanh,
      alicesprings: alicesprings ?? this.alicesprings,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [muongthanh, alicesprings, id];
}
