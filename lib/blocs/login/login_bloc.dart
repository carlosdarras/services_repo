import 'package:bloc/bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginShowPassword>(_onLoginShowPassword);
  }

  bool hiddenPassword = true;

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
}
