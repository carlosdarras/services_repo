import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordStartProcess>(_onForgetPasswordStartProcess);
  }

  TextEditingController controller = TextEditingController();

  Future<void> _onForgetPasswordStartProcess(
    ForgetPasswordStartProcess event,
    Emitter emit,
  ) async {
    emit(ForgetPasswordSendVerificationLinkLoadingState());
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: controller.text.trim())
        .then((value) {
      debugPrint('The email send successfully');
      emit(ForgetPasswordSendVerificationLinkSuccessState());
    }).catchError((e) {
      debugPrint('Error in _onForgetPasswordStartProcess ::: ${e.toString()}');
      emit(ForgetPasswordSendVerificationLinkFailState());
    });
  }
}
