import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/auth/auth_event.dart';
import 'package:hubline/bloc/auth/auth_state.dart';
import 'package:hubline/utility.dart';
import 'package:hubline/model/Customer.dart';
import 'package:hubline/repositiory/AuthRepo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo = AuthRepo();
  AuthBloc() : super(InitialState()) {
    on<SignUpEvent>(_signUp);
    on<LoginEvent>(_logIn);
  }
  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    if (event.password != event.confirm) {
      print(event.password);
      print(event.confirm);
      emit(InitialState(error: "confirm passoword error"));
      return;
    }
    try {
      final response =
          await authRepo.signup(event.fullname, event.email, event.password);
      await authRepo.setToken(response['token']);
      await authRepo.setCustomer(response['user']);
      print(await authRepo.token);

      emit(SignUpState(response['token'], response['user']));
    } catch (e) {
      if (e is DioException) {
        String error = handleDioError(e);
        print(error);
        final arg = {"type": ErrorType.noconnect, "msg": error};
        Navigator.pushNamed(event.context, '/error', arguments: arg);
      }
    }
  }

  Future<void> _logIn(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    try {
      final response = await authRepo.login(event.email, event.password);
      await authRepo.setToken(response['token']);
      await authRepo.setCustomer(response['user']);
      print(await authRepo.token);

      emit(LoginState(response['token'], response['user']));
    } catch (e) {
      if (e is DioException) {
        String error = handleDioError(e);
        print(error);
        final arg = {"type": ErrorType.noconnect, "msg": error};
        Navigator.pushNamed(event.context, '/error', arguments: arg);
      }
    }
  }
}
