part of 'details_bloc.dart';
/// Abstract class for all events that can be dispatched from the
///Details widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
/// Event that is dispatched when the Details widget is first created.
class DetailsInitialEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}