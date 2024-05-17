import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/data/repositories/login_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginShowPassword>(_onLoginShowPassword);
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
  }

  LoginRepository loginRepository;

  bool hiddenPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void _onLoginShowPassword(
    LoginShowPassword event,
    Emitter emit,
  ) async {
    try {
      hiddenPassword = !hiddenPassword;
      emit(LoginShowPasswordSuccessState());
    } catch (e) {
      emit(LoginShowPasswordFailState());
    }
  }

  void _onLoginStartProcessEvent(
    LoginStartProcessEvent event,
    Emitter emit,
  ) async {
    print('we enter here ...... ');
    try {
      loginRepository.login(
          emailController.text, passwordController.text);
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
    }
  }
}
