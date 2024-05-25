import 'package:flutter/material.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/view/tools.dart';

import 'blocs/login/login_bloc.dart';
import 'data/repositories/login_repo.dart';
import 'view/screens/login/login_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return RepositoryProvider(
        create: (context) => LoginRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(),
            ),
            BlocProvider(
              create: (context) => LoginBloc(
                  context.read<LoginRepository>(), context.read<MainBloc>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Nunito",
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                foregroundColor: Colors.black,
              ),
            ),
            home: LoginView(),
          ),
        ),
      );
    });
  }
}
