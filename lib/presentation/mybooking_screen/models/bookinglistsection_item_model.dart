import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [bookinglistsection_item_widget] screen.
// ignore_for_file: must_be_immutable
class BookinglistsectionItemModel extends Equatable {
  BookinglistsectionItemModel(
      {
        this.imageOne,
        this.fifty,
        this.fourhundredsixt,
        this.id
      })
  {
    imageOne = imageOne ?? ImageConstant.imgAntDesignStarFilled;
    fifty = fifty ?? "5.0";
    fourhundredsixt = fourhundredsixt ?? "(463)";
    id = id ?? "";
  }

  String? imageOne;
  String? fifty;
  String? fourhundredsixt;
  String? id;

  BookinglistsectionItemModel copyWith({
    String? imageOne,
    String? fifty,
    String? fourhundredsixt,
    String? id,
  }) {
    return BookinglistsectionItemModel(
      imageOne: imageOne ?? this.imageOne,
      fifty: fifty ?? this.fifty,
      fourhundredsixt: fourhundredsixt ?? this.fourhundredsixt,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [imageOne, fifty, fourhundredsixt, id];
}
