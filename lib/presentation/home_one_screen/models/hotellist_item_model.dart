import 'package:equatable/equatable.dart';
import 'package:hotelsbooking/core/app_export.dart';

/// This class is used in the [home_one_one_item_widget] screen.
// ignore_for_file: must_be_immutable
class HotellistItemModel extends Equatable {
  HotellistItemModel(
      {
        this.dayOne,
        this.price,
        this.dayThree,
        this.fifty,
        this.fourhundredsixt,
        this.theastonvil,
        this.streetromeny,
        this.id
      }) {
    dayOne = dayOne ?? ImageConstant.imgImageDefaultProperty1;
    price = price ?? "\$38/Day";
    dayThree = dayThree ?? ImageConstant.imgHeart;
    fifty = fifty ?? "5.0";
    fourhundredsixt = fourhundredsixt ?? "(463)";
    theastonvil = theastonvil ?? "The Aston Vil Hotel ";
    streetromeny = streetromeny ?? "StreetRome, NY 13440";
    id = id ?? "";
  }
  String? dayOne;
  String? price;
  String? dayThree;
  String? fifty;
  String? fourhundredsixt;
  String? theastonvil;
  String? streetromeny;
  String? id;

  HotellistItemModel copyWith({
    String? dayOne,
    String? price,
    String? dayThree,
    String? fifty,
    String? fourhundredsixt,
    String? theastonvil,
    String? streetromeny,
    String? id,
  }) {
    return HotellistItemModel(
      dayOne: dayOne ?? this.dayOne,
      price: price ?? this.price,
      dayThree: dayThree ?? this.dayThree,
      fifty: fifty ?? this.fifty,
      fourhundredsixt: fourhundredsixt ?? this.fourhundredsixt,
      theastonvil: theastonvil ?? this.theastonvil,
      streetromeny: streetromeny ?? this.streetromeny,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        dayOne,
        price,
        dayThree,
        fifty,
        fourhundredsixt,
        theastonvil,
        streetromeny,
        id
      ];
}
