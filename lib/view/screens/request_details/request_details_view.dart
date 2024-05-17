import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: "Service Name",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        children: [
          Container(
            height: 25.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29tcGFuaWVzfGVufDB8fDB8fHww"))),
          ),
          VerticalSpacing(2),
          TextWidget(
            text: "Service Name",
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
          VerticalSpacing(0.4),
          TextWidget(
            text: "Company Name",
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
          const VerticalSpacing(2),
          TextWidget(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
            maxLines: 10,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          const VerticalSpacing(2),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.myGrey),
            child: Row(
              children: [
                Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const HorizontalSpacing(2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Location Name",
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                      const VerticalSpacing(
                        0.5,
                        width: 0,
                      ),
                      TextWidget(
                        text: "location details, Building NO.15",
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(2),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.myGrey),
            child: Row(
              children: [
                Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.timer_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const HorizontalSpacing(2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Date: 17/2/2024",
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                      const VerticalSpacing(
                        0.5,
                        width: 0,
                      ),
                      TextWidget(
                        text: "Time: 6:00 PM",
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(2),
          //https://images.unsplash.com/photo-1538474705339-e87de81450e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cGx1bWJpbmd8ZW58MHx8MHx8fDA%3D
        ],
      ),
    );
  }
}
