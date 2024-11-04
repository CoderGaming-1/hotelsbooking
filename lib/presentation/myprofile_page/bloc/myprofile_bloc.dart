import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/myprofile_model.dart';
part 'myprofile_event.dart';
part 'myprofile_state.dart';

class MyprofileBloc extends Bloc<MyprofileEvent, MyprofileState>
{
  MyprofileBloc (MyprofileState initialstate):
  super(initialstate) {
    on<MyprofileInitialEvent>(_onInitialize);
}
_onInitialize(
    MyprofileInitialEvent event,
    Emitter<MyprofileState> emit,
) async {}
}