import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.myGrey,
              radius: 20.sp,
            ),
            const HorizontalSpacing(2),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Mohammed Rashed",
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(text: "93489"),
              ],
            ),
          ],
        ),
        const VerticalSpacing(4),
        Row(
          children: [
            TextWidget(
              text: "Cars To Rent",
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            const Spacer(),
            CustomTextButtons(
              onPressed: () {},
              text: "see more",
            )
          ],
        ),
        SizedBox(
          height: 23.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.myGrey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 13.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey),
                    ),
                    const VerticalSpacing(0.5),
                    TextWidget(
                      text: "Kia Nero",
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                    TextWidget(
                      text: "green",
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      textColor: Colors.grey,
                    ),
                    TextWidget(
                      text: "10 JOD per day",
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      textColor: AppColors.primaryColor,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const HorizontalSpacing(2),
            itemCount: 6,
          ),
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            Container(
              height: 30.h,
              width: 45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.myGrey),
            ),
            const HorizontalSpacing(2),
            Column(
              children: [
                Container(
                  height: 14.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.myGrey),
                ),
                const VerticalSpacing(
                  2,
                  width: 0,
                ),
                Container(
                  height: 14.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.myGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const VerticalSpacing(2),
      ],
    );
  }
}
