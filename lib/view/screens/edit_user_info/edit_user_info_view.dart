import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';

import 'edit_user_info_content.dart';

class EditUserInfoView extends StatelessWidget {
  const EditUserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "Edit Information",),
      ),
      body: EditUserInfoContent(),
    );
  }
}
