import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class FeedbackContent extends StatelessWidget {
  const FeedbackContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      children: [
        TextWidget(
          text: "Your Voice Is Important!!",
          fontSize: 15.sp,
          fontWeight: FontWeight.w900,
        )
      ],
    );
  }
}
