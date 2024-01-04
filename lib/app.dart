import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'view/screens/login/login_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
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
        home:  LoginView(),
      );
    });
  }
}
