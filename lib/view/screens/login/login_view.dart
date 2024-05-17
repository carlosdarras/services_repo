import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_repo/blocs/login/login_bloc.dart';
import 'package:services_repo/data/repositories/login_repo.dart';
import 'package:services_repo/view/screens/login/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: BlocProvider(
        create: (context) => LoginBloc(context.read<LoginRepository>()),
        child: Scaffold(
          body: LoginContent(),
        ),
      ),
    );
  }
}
