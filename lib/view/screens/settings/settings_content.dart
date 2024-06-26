import 'package:flutter/material.dart';
import 'package:services_repo/blocs/home_services_section/home_services_section_bloc.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/view/about_us/about_us_view.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/edit_user_info/edit_user_info_view.dart';
import 'package:services_repo/view/screens/my_requests/my_requests_view.dart';
import 'package:services_repo/view/tools.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
      children: [
        TextWidget(
          text: "Profile",
          fontSize: 20.sp,
          fontWeight: FontWeight.w900,
        ),
        const VerticalSpacing(2),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.myGrey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: "Name:",
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.primaryColor,
                        fontSize: 11.sp,
                      ),
                      const HorizontalSpacing(2),
                      TextWidget(
                        text: mainBloc.userInfoModel!.name!,
                        fontSize: 11.sp,
                      ),
                    ],
                  ),
                  const VerticalSpacing(
                    1,
                    width: 0,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "Email:",
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.primaryColor,
                        fontSize: 11.sp,
                      ),
                      const HorizontalSpacing(2),
                      TextWidget(
                        text: mainBloc.userInfoModel!.email!,
                        fontSize: 11.sp,
                      ),
                    ],
                  ),
                  const VerticalSpacing(
                    1,
                    width: 0,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "Phone number:",
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.primaryColor,
                        fontSize: 11.sp,
                      ),
                      const HorizontalSpacing(2),
                      TextWidget(
                        text: mainBloc.userInfoModel!.phoneNumber!,
                        fontSize: 11.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const VerticalSpacing(3),
        TextWidget(
          text: "Other Settings",
          fontSize: 20.sp,
          fontWeight: FontWeight.w900,
        ),
        const VerticalSpacing(2),
        InkWell(
          onTap: () {
            navigateTo(context, const EditUserInfoView());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.myGrey),
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
                HorizontalSpacing(2),
                TextWidget(text: "Edit information"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
        ),
        const VerticalSpacing(2),
        InkWell(
          onTap: () {
            context.read<HomeServicesSectionBloc>().add(GetAllRequests());
            navigateTo(context, const MyRequestsView());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.myGrey),
            child: const Row(
              children: [
                Icon(
                  Icons.request_page_outlined,
                  color: AppColors.primaryColor,
                ),
                HorizontalSpacing(2),
                TextWidget(text: "My Requests"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
        // const VerticalSpacing(2),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(15), color: AppColors.myGrey),
        //   child: const Row(
        //     children: [
        //       Icon(
        //         Icons.notifications,
        //         color: AppColors.primaryColor,
        //       ),
        //       HorizontalSpacing(2),
        //       TextWidget(text: "Notification"),
        //       Spacer(),
        //       Icon(Icons.arrow_forward_ios_rounded),
        //     ],
        //   ),
        // ),
        const VerticalSpacing(2),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: AppColors.myGrey),
          child: const Row(
            children: [
              Icon(
                Icons.insert_drive_file_outlined,
                color: AppColors.primaryColor,
              ),
              HorizontalSpacing(2),
              TextWidget(text: "Give a Feedback"),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
        // const VerticalSpacing(2),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(15), color: AppColors.myGrey),
        //   child: const Row(
        //     children: [
        //       Icon(
        //         Icons.contact_page_rounded,
        //         color: AppColors.primaryColor,
        //       ),
        //       HorizontalSpacing(2),
        //       TextWidget(text: "Contact us"),
        //       Spacer(),
        //       Icon(Icons.arrow_forward_ios_rounded),
        //     ],
        //   ),
        // ),
        const VerticalSpacing(2),
        InkWell(
          onTap: () {
            navigateTo(context, const AboutUsView());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.myGrey),
            child: const Row(
              children: [
                Icon(
                  Icons.account_balance_sharp,
                  color: AppColors.primaryColor,
                ),
                HorizontalSpacing(2),
                TextWidget(text: "About us"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
        const VerticalSpacing(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ActionButton(
            onPressed: () {

              navigateBack(context);
            },
            text: "Sign out",
            fontWight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
