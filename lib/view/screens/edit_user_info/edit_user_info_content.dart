import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class EditUserInfoContent extends StatelessWidget {
  const EditUserInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40.sp,
              backgroundColor: AppColors.myGrey,
            ),
            const VerticalSpacing(1),
            const TextWidget(
              text: "Upload Image",
              textColor: Colors.grey,
            ),
          ],
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Email",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        EmailWithoutIcon(controller: TextEditingController()),
        const VerticalSpacing(2),
        TextWidget(
          text: "Name",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        NamesFiled(controller: TextEditingController()),
        const VerticalSpacing(2),
        TextWidget(
          text: "Phone Number",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        NumbersField(controller: TextEditingController()),
        VerticalSpacing(3),
        ActionButton(onPressed: (){},text: "Save",backgroundColor: Colors.cyan,)
      ],
    );
  }
}
