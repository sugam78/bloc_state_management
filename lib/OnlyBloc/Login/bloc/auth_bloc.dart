import 'package:bloc_state_management/OnlyBloc/Login/bloc/bloc_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc(): super(AuthInitial()){
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  // @override
  // void onChange(Change<AuthState> change) {
  //   super.onChange(change);
  //   debugPrint('$change');
  // }
  //
  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   super.onTransition(transition);
  //   debugPrint('$transition');
  // }

  void _onAuthLoginRequested(AuthLoginRequested event,Emitter<AuthState> emit)async{
    emit(AuthLoading());
    try{
      final email = event.email;
      final password = event.password;
      if(email.isEmpty){
        emit(AuthFailure('Email cant be empty'));
        return;
      }
      if(password.isEmpty){
        emit(AuthFailure('Passoword cant be empty'));
        return;
      }
      if(password.length <6){
        emit(AuthFailure('Password cant be less than 6 characters '));
        return;
      }
      await Future.delayed(Duration(seconds: 1),(){
        return emit(AuthSuccess('$email$password'));
      });
    }
    catch(e){
      return emit(AuthFailure('$e'));
    }
  }

  void _onAuthLogoutRequested(event,emit)async{
    emit(AuthLoading());
    try{
      await Future.delayed(Duration(seconds: 1),(){
        return emit(AuthInitial());
      });
    }
    catch(e){
      emit(AuthFailure('$e'));
    }
  }
}