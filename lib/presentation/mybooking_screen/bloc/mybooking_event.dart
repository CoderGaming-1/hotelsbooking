part of 'mybooking_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Mybooking widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class MybookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Mybooking widget is first created.
class MybookingInitialEvent extends MybookingEvent {
  @override
  List<Object?> get props => [];
}
