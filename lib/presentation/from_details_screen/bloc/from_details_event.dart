part of 'from_details_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FromDetails widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class FromDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the FromDetails widget is first created.
class FromDetailsInitialEvent extends FromDetailsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing date
// ignore_for_file: must_be_immutable
class ChangeDateEvent extends FromDetailsEvent {
  ChangeDateEvent({required this.date});

  DateTime date;

  @override
  List<Object?> get props => [date];
}

///Event for changing checkbox
// ignore_for_file: must_be_immutable
class ChangeCheckBoxEvent extends FromDetailsEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing checkbox
// ignore_for_file: must_be_immutable
class ChangeCheckBox1Event extends FromDetailsEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing checkbox
// ignore_for_file: must_be_immutable
class ChangeCheckBox2Event extends FromDetailsEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}
