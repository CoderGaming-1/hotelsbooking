import 'package:hotelsbooking/presentation/sign_in_screen/bloc/sign_in_event.dart';
import 'package:hotelsbooking/presentation/sign_in_screen/bloc/sign_in_state.dart';

import 'package:hotelsbooking/core/app_export.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc(SignInState initialState) : super(initialState){
    on<SignInStarted>(_onSignInStarted);
  }

  void _onSignInStarted(SignInStarted event, Emitter<SignInState> emit){
    emit(SignInProgress());
  }
}