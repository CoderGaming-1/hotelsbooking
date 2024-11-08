import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
/// This class is used in the [checkout_three_item_widget] screen.
// ignore_for_file: must_be_immutable
class CheckoutThreeItemModel extends Equatable {
CheckoutThreeItemModel(
    {this.dateOne, this.datesTwo, this.nov2024, this.id}) {
  dateOne = dateOne ?? ImageConstant.imgCalendarmonth;
  datesTwo = datesTwo ?? "Dates";
  nov2024 = nov2024 ?? "12 15 Nov 2024";
  id = id ?? "";
}
String? dateOne;
String? datesTwo;
String? nov2024;
String? id;
CheckoutThreeItemModel copywith({
  String? datesOne,
  String? datesTwo,
  String? nov2024,
  String? id,
}) {
  return CheckoutThreeItemModel(
    dateOne: datesOne ?? this.dateOne,
      datesTwo: datesTwo ?? this.datesTwo,
      nov2024: nov2024 ?? this.nov2024,
      id: id ?? this.id,
  );
}
@override
List<Object?> get props => [dateOne, datesTwo, nov2024, id];
}