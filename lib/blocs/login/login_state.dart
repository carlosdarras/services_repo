part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginShowPasswordSuccessState extends LoginState {}
class LoginShowPasswordFailState extends LoginState {}
