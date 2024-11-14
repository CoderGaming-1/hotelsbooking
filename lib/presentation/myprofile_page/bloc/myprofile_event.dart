part of 'myprofile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Myprofile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class MyprofileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Myprofile widget is first created.
class MyprofileInitialEvent extends MyprofileEvent {
  @override
  List<Object?> get props => [];
}
