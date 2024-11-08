import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/editprofile_model.dart';
part 'editprofile_event.dart';
part 'editprofile_state.dart';

/// A bloc that manages the state of a Editprofile according to the event that
class EditprofileBloc extends Bloc<EditprofileEvent, EditprofileState> {
  EditprofileBloc(EditprofileState initialstate) : super(initialstate) {
    on<EditprofileInitialEvent>(_onInitialize);
  }
  _onInitialize(
    EditprofileInitialEvent event,
    Emitter<EditprofileState> emit,
  ) async {
    emit(
      state.copywith(
        userNameController: TextEditingController(),
        emailtwoController: TextEditingController(),
        phoneNumberController: TextEditingController(),
      ),
    );
  }
}
