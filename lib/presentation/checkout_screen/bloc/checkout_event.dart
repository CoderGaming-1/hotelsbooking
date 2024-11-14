part of 'checkout_bloc.dart';
/// Abstract class for all events that can be dispatched from the
///Checkout widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class CheckoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
/// Event that is dispatched when the Checkout widget is first created.
class CheckoutInitialEvent extends CheckoutEvent {
  @override
  List<Object?> get props => [];
}