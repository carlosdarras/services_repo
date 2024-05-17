import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class MyRequestsContent extends StatelessWidget {
  const MyRequestsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.myGrey,
              ),
              child: Row(
                children: [
                  Container(
                    height: 8.5.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29tcGFuaWVzfGVufDB8fDB8fHww"),
                      ),
                    ),
                  ),
                  const HorizontalSpacing(2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: "#q3454423",
                          fontWeight: FontWeight.w900,
                        ),
                        const TextWidget(
                          text: "Service Name",
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 12.sp,
                              color: AppColors.primaryColor,
                            ),
                            const HorizontalSpacing(1),
                            TextWidget(
                              text: "6:00 PM",
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                        TextWidget(
                          text: "pending...",
                          textColor: Colors.grey,
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const VerticalSpacing(2),
          itemCount: 10,
        )
      ],
    );
  }
}
