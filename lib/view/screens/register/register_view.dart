import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_repo/blocs/register/register_bloc.dart';
import 'package:services_repo/data/repositories/register_repo.dart';
import 'package:services_repo/view/screens/register/register_content.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RegisterRepository(),
      child: BlocProvider(
        create: (context) => RegisterBloc(context.read<RegisterRepository>()),
        child: const Scaffold(
          body: RegisterContent(),
        ),
      ),
    );
  }
}
