import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/data/repositories/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository, this.mainBloc) : super(LoginInitial()) {
    on<LoginShowPassword>(_onLoginShowPassword);
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
  }

  LoginRepository loginRepository;
  MainBloc mainBloc;
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
    emit(LoginStartProcessLoadingState());
    try {
      mainBloc.userInfoModel = await loginRepository.login(
          emailController.text, passwordController.text);
      emit(LoginStartProcessSuccessState());
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(LoginStartProcessLoadingState());
    }
  }
}
