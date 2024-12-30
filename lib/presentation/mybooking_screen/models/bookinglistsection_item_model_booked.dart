import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the "Booked" tab page.
class BookinglistsectionItemModelBooked extends Equatable {
  BookinglistsectionItemModelBooked({
    this.imageOne,
    this.fifty,
    this.fourhundredsixt,
    this.id,
  }) {
    imageOne = imageOne ?? ImageConstant.imgAntdesignstarfilled; // Default image for "Booked"
    fifty = fifty ?? "4.5"; // Default rating for "Booked"
    fourhundredsixt = fourhundredsixt ?? ""; // Default reviews for "Booked"
    id = id ?? "";
  }

  String? imageOne;
  String? fifty;
  String? fourhundredsixt;
  String? id;

  BookinglistsectionItemModelBooked copyWith({
    String? imageOne,
    String? fifty,
    String? fourhundredsixt,
    String? id,
  }) {
    return BookinglistsectionItemModelBooked(
      imageOne: imageOne ?? this.imageOne,
      fifty: fifty ?? this.fifty,
      fourhundredsixt: fourhundredsixt ?? this.fourhundredsixt,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [imageOne, fifty, fourhundredsixt, id];
}
