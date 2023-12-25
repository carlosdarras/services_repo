import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';


class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text:text ,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp,
    );
  }
}
