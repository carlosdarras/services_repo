part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginShowPasswordSuccessState extends LoginState {}
class LoginShowPasswordFailState extends LoginState {}

class LoginStartProcessLoadingState extends LoginState {}
class LoginStartProcessSuccessState extends LoginState {}
class LoginStartProcessFailState extends LoginState {}
