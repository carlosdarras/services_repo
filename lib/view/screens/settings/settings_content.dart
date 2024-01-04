import 'package:flutter/cupertino.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/common_widgets/vertical_spacing.dart';
import 'package:services_repo/view/tools.dart';


class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 7.h),
      children: [
        TextWidget(text: "Settings",fontSize: 20.sp ,fontWeight: FontWeight.w900,),
        const VerticalSpacing(2),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
        )
      ],
    );
  }
}
