part of 'checkout_bloc.dart';

/// Represents the state of Checkout in the application.
// ignore_for_file: must_be_immutable
class CheckoutState extends Equatable {
  CheckoutState({this.checkoutModelObj});

  CheckoutModel? checkoutModelObj;

  @override
  List<Object?> get props => [checkoutModelObj];

  CheckoutState copywith({CheckoutModel? checkoutModelObj}) {
    return CheckoutState(
      checkoutModelObj: checkoutModelObj ?? this.checkoutModelObj,
    );
  }
}
