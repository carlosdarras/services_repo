import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:services_repo/blocs/home_services_section/home_services_section_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/bottom_nav_bar/bottom_navigation_bar_view.dart';
import 'package:services_repo/view/tools.dart';

class UploadRequestInfo extends StatelessWidget {
  const UploadRequestInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeServiceBloc = context.read<HomeServicesSectionBloc>();
    var homeServiceBlocListener = context.watch<HomeServicesSectionBloc>();
    return BlocListener<HomeServicesSectionBloc, HomeServicesSectionState>(
      listener: (context, state) {
        if (state is HomeServicesSendRequestSuccess) {
          navigateOff(context, const BottomNavigationBarView());
        }
      },
      child: Scaffold(
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
              controller: homeServiceBloc.infoController,
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
            GestureDetector(
              onTap: () {
                homeServiceBloc.add(UploadImage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.myGrey),
                child: homeServiceBlocListener.profileImage != null
                    ? Image.file(homeServiceBloc.profileImage!)
                    : Column(
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
            ),
            const VerticalSpacing(2),
            TextWidget(
              text: "Location",
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            const VerticalSpacing(1),
            NamesFiled(
              controller: homeServiceBloc.locationController,
              hintText: "Location",
            ),
            const VerticalSpacing(2),
            TextWidget(
              text: "Date",
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            const VerticalSpacing(1),
            GestureDetector(
              onTap: () {
                homeServiceBloc.add(SelectDateEvent(context));
              },
              child: Container(
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
                    TextWidget(
                      text:
                          "Date: ${homeServiceBlocListener.dateTime != null ? DateFormat('dd/MM/yyyy').format(homeServiceBlocListener.dateTime!) : "No Date Yet!!"}",
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const VerticalSpacing(2),
            TextWidget(
              text: "Time",
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            const VerticalSpacing(1),
            GestureDetector(
              onTap: () {
                homeServiceBloc.add(SelectTimeEvent(context));
              },
              child: Container(
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
                    TextWidget(
                      text: homeServiceBlocListener.timeOfDay != null
                          ? "Time: ${homeServiceBlocListener.timeOfDay!.hour}:${homeServiceBlocListener.timeOfDay!.minute}"
                          : "Time:",
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const VerticalSpacing(2),
            homeServiceBlocListener.state is HomeServicesSendRequestLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ActionButton(
                    onPressed: () {
                      homeServiceBloc.add(SendRequest());
                    },
                    text: "Check out",
                  )
          ],
        ),
      ),
    );
  }
}
