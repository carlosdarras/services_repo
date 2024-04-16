import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/screens/contact_us/contact_us_content.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: "Contact Us",
        ),
      ),
      body: ContactUsContent(),
    );
  }
}
