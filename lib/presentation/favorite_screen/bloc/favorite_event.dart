part of 'favorite_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Favorite widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Favorite widget is first created.
class FavoriteInitialEvent extends FavoriteEvent {
  @override
  List<Object?> get props => [];
}
