import 'package:equatable/equatable.dart';

/// This class is used in the [filter_one_item_widget] screen.
// ignore_for_file: must_be_immutable
class FilterOneItemModel extends Equatable {
  FilterOneItemModel({this.five, this.id}) {
    five = five ?? "5";
    id = id ?? "";
  }

  String? five;
  String? id;

  FilterOneItemModel copyWith({
    String? five,
    String? id,
  }) {
    return FilterOneItemModel(
      five: five ?? this.five,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [five, id];
}
