import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/data/repositories/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepository, this.mainBloc)
      : super(RegisterInitial()) {
    on<RegisterEmailAndPasswordEvent>(_onRegisterEmailAndPasswordEvent);
  }

  RegisterRepository registerRepository;

  bool hiddenPassword = true;

  MainBloc mainBloc;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController postelCodeController = TextEditingController();
  TextEditingController passwordCodeController = TextEditingController();

  void _onRegisterEmailAndPasswordEvent(
    RegisterEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(RegisterStartProcessLoadingState());
    try {
      mainBloc.userInfoModel = await registerRepository.register(
        email: emailController.text,
        password: passwordCodeController.text,
        image: "",
        postelCode: num.parse(postelCodeController.text),
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
      );
      emit(RegisterStartProcessSuccessState());
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(RegisterStartProcessFailState());
    }
  }
}
