part of 'filter_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Filter widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class FilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Filter widget is first created.
class FilterInitialEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
// ignore_for_file: must_be_immutable
class ChangeCheckBoxEvent extends FilterEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing checkbox

class ChangeCheckBox1Event extends FilterEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing checkbox

class ChangeCheckBox2Event extends FilterEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends FilterEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

// class UpdatePriceRangeEvent extends FilterEvent {
//   final RangeValues newRange;
//   // const UpdatePriceRangeEvent({required this.newRange});
// }
