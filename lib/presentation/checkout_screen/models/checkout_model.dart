import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'checkout_three_item_model.dart';

/// This class defines the variables used in the [checkout_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class CheckoutModel extends Equatable {
  CheckoutModel({this.checkoutThreeItemList = const []});

  List<CheckoutThreeItemModel> checkoutThreeItemList;

  CheckoutModel copyWith(
      {List<CheckoutThreeItemModel>? checkoutThreeItemList}) {
    return CheckoutModel(
      checkoutThreeItemList:
          checkoutThreeItemList ?? this.checkoutThreeItemList,
    );
  }

  @override
  List<Object?> get props => [checkoutThreeItemList];
}
