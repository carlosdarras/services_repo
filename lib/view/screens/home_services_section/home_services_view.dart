import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/screens/home_services_section/home_services_content.dart';

class HomeServicesView extends StatelessWidget {
  const HomeServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "Home Services",),
      ),
      body: HomeServicesContent(),
    );
  }
}
