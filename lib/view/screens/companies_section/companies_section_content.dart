import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/upload_request_info/upload_request_info.dart';
import 'package:services_repo/view/tools.dart';

class CompaniesSectionContent extends StatelessWidget {
  const CompaniesSectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      children: [
        TextWidget(
          text: "Service Name",
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
        TextWidget(
          text:
              "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
          maxLines: 10,
          fontSize: 10.sp,
        ),
        const VerticalSpacing(2),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                navigateTo(context, const UploadRequestInfo());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.myGrey,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 7.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29tcGFuaWVzfGVufDB8fDB8fHww"),
                        ),
                      ),
                    ),
                    const HorizontalSpacing(2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Company Name",
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "Rate:",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const HorizontalSpacing(2),
                            TextWidget(
                              text: "4.6",
                              fontSize: 10.sp,
                            ),
                            const HorizontalSpacing(1),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 13.sp,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "price:",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const HorizontalSpacing(2),
                            TextWidget(
                              text: "30-45 JD",
                              fontSize: 10.sp,
                            ),
                            HorizontalSpacing(1),
                            Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.green,
                              size: 13.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const VerticalSpacing(2),
          itemCount: 10,
        ),
      ],
    );
  }
}
