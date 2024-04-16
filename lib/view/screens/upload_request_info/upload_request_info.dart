import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/request_details/request_details_view.dart';
import 'package:services_repo/view/tools.dart';

class UploadRequestInfo extends StatelessWidget {
  const UploadRequestInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: "Request Info",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        children: [
          TextWidget(
            text: "Information",
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          const VerticalSpacing(1),
          TextArea(
            controller: TextEditingController(),
            filledColor: AppColors.myGrey,
            isEnabledWithBorder: false,
            isFocusedWithBorder: false,
            enabledBorderRadius: 30,
            focusedBorderRadius: 30,
          ),
          const VerticalSpacing(2),
          TextWidget(
            text: "Upload Image",
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          const VerticalSpacing(1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.myGrey),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.uploadImage,
                  height: 10.h,
                  color: AppColors.primaryColor,
                ),
                const VerticalSpacing(1),
                const TextWidget(
                  text: "Click To Upload Image",
                  textColor: Colors.grey,
                ),
              ],
            ),
          ),
          const VerticalSpacing(2),
          TextWidget(
            text: "Location",
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          const VerticalSpacing(1),
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
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          const VerticalSpacing(2),
          TextWidget(
            text: "Time",
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          const VerticalSpacing(1),
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
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          const VerticalSpacing(2),
          ActionButton(
            onPressed: () {
              navigateTo(context, RequestDetailsView());
            },
            text: "Check out",
          )
        ],
      ),
    );
  }
}
