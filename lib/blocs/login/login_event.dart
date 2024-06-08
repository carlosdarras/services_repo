part of 'login_bloc.dart';


abstract class LoginEvent {}


class LoginShowPassword extends LoginEvent{}
class LoginStartProcessEvent extends LoginEvent{}
class LoginUsingGoogle extends LoginEvent{}
