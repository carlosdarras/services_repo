part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
///================================================
class RegisterStartProcessLoadingState extends RegisterState {}
class RegisterStartProcessSuccessState extends RegisterState {}
class RegisterStartProcessFailState extends RegisterState {}
