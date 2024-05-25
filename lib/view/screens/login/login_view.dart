import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_repo/blocs/login/login_bloc.dart';
import 'package:services_repo/data/repositories/login_repo.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/common_widgets/show_toast.dart';
import 'package:services_repo/view/screens/home/home_view.dart';
import 'package:services_repo/view/screens/login/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginStartProcessSuccessState){
          navigateTo(context, HomeView());
        }else if(state is LoginStartProcessFailState){
          showToast(text:"Eriririr", state: ToastState.ERROR);
        }
      },
      child: Scaffold(
        body: LoginContent(),
      ),
    );
  }
}
