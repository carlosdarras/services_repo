import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/start_end_time_field.dart';
import 'package:services_repo/view/tools.dart';

class FieldsDetailsContent extends StatelessWidget {
  const FieldsDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      children: [
        Container(
          height: 20.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.myGrey,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1556056504-5c7696c4c28d?q=80&w=3257&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
          ),
        ),
        VerticalSpacing(2),
        TextWidget(
          text: "Jordan University Fields",
          fontSize: 15.sp,
          fontWeight: FontWeight.w900,
        ),
        VerticalSpacing(1),
        TextWidget(
          text:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          fontSize: 11.sp,
          maxLines: 5,
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            Icon(
              Icons.timer,
              size: 14.sp,
              color: Colors.deepOrange,
            ),
            HorizontalSpacing(1),
            TextWidget(
              text: "Work Time 9:00 AM to 9:00 PM",
              fontSize: 10.sp,
            ),
          ],
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 14.sp,
              color: Colors.deepOrange,
            ),
            HorizontalSpacing(1),
            TextWidget(
              text: "Sport City st.21",
              fontSize: 10.sp,
            ),
          ],
        ),
        VerticalSpacing(2),
        TextWidget(
          text: "Date & Time",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        VerticalSpacing(1),
        SizedBox(
          height: 10.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 14.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.myGrey,
                ),
                child: Column(
                  children: [
                    TextWidget(
                      text: "Sun",
                      fontSize: 10.sp,
                    ),
                    TextWidget(
                      text: "29",
                      fontWeight: FontWeight.w900,
                      textColor: AppColors.primaryColor,
                    ),
                    TextWidget(
                      text: "Sep",
                      fontSize: 10.sp,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => HorizontalSpacing(2),
            itemCount: 10,
          ),
        ),
        VerticalSpacing(2),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "Start"),
                  VerticalSpacing(1),
                  StartEndTimeField(
                    hintText: "Start",
                    controller: TextEditingController(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            HorizontalSpacing(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "End"),
                  VerticalSpacing(1),
                  StartEndTimeField(
                    hintText: "End",
                    controller: TextEditingController(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        VerticalSpacing(2),
        ActionButton(onPressed: (){},text: "Reserve",fontWight: FontWeight.bold,)
      ],
    );
  }
}
