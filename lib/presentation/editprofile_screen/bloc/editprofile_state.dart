part of 'editprofile_bloc.dart';

/// Represents the state of Editprofile in the application.
// ignore_for_file: must_be_immutable
class EditprofileState extends Equatable {
  EditprofileState(
      {this.userNameController,
      this.emailtwoController,
      this.phoneNumberController,
      this.editprofileModelObj});

  TextEditingController? userNameController;
  TextEditingController? emailtwoController;
  TextEditingController? phoneNumberController;
  EditprofileModel? editprofileModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        emailtwoController,
        phoneNumberController,
    editprofileModelObj
      ];

  EditprofileState copywith({
    TextEditingController? userNameController,
    TextEditingController? emailtwoController,
    TextEditingController? phoneNumberController,
    EditprofileModel? editprofileModelobj,
  }) {
    return EditprofileState(
      userNameController: userNameController ?? this.userNameController,
      emailtwoController: emailtwoController ?? this.emailtwoController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      editprofileModelObj: editprofileModelobj ?? this.editprofileModelObj,
    );
  }
}
