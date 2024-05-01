import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/screens/my_requests/my_requests_content.dart';

class MyRequestsView extends StatelessWidget {
  const MyRequestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "My Requests"),
      ),
      body: const MyRequestsContent(),
    );
  }
}
