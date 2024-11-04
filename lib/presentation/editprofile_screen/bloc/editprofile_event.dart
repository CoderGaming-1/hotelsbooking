part of 'editprofile_bloc.dart';
/// Abstract class for all events that can be dispatched from the
///Editprofile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class EditprofileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
/// Event that is dispatched when the Editprofile widget is first created.
class EditprofileInitialEvent extends EditprofileEvent {
  @override
  List<Object?> get props => [];
}