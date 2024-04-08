import 'package:flutter/material.dart';
import 'package:services_repo/view/screens/home/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HomeContent(),
    );
  }
}
