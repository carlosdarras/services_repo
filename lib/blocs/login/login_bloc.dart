import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/core/services/cash_helper.dart';
import 'package:services_repo/data/models/user_info.dart';
import 'package:services_repo/data/repositories/login_repo.dart';

import '../../data/models/user_info_google.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository, this.mainBloc) : super(LoginInitial()) {
    on<LoginShowPassword>(_onLoginShowPassword);
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
    on<LoginUsingGoogle>(_onLoginUsingGoogle);
  }

  LoginRepository loginRepository;
  MainBloc mainBloc;
  bool hiddenPassword = true;
  GoogleUserInfo? googleUserInfo;

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

      await CashHelper.saveData(
          key: "userId", value: mainBloc.userInfoModel!.id);
      userId = mainBloc.userInfoModel!.id!;

      emit(LoginStartProcessSuccessState());
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(LoginStartProcessFailState());
    }
  }

  void _onLoginUsingGoogle(
      LoginUsingGoogle event,
      Emitter emit,
      ) async {
    try {
      emit(LoginUsingGoogleLoadingState());
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      googleUserInfo = GoogleUserInfo.fromJson(userCredential.user!);
      // mainBloc.userInfoModel = UserInfoModel.fromJson(userCredential.user!, id);
      emit(LoginUsingGoogleSuccessState());
    } catch (e) {
      print('the error is ${e.toString()}');
      emit(LoginUsingGoogleFailState());
    }
  }
}
