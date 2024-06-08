part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSendVerificationLinkLoadingState
    extends ForgetPasswordState {}

class ForgetPasswordSendVerificationLinkSuccessState
    extends ForgetPasswordState {}

class ForgetPasswordSendVerificationLinkFailState extends ForgetPasswordState {}
