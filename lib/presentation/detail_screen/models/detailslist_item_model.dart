import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
/// This class is used in the [detailslist_item_widget] screen.
// ignore_for_file: must_be_immutable
class DetailslistItemModel extends Equatable {
  DetailslistItemModel({this.image, this.id}) {
    image = image ?? ImageConstant.imgImage9;
    id = id ?? "";
  }
  String? image;
  String? id;
  DetailslistItemModel copyWith({
    String? image,
    String? id,
  }) {
    return DetailslistItemModel(
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
    @override
    List<Object?> get props =>
    [image, id];
  }