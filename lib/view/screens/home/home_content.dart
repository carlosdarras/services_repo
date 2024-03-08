import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/home_services_section/home_services_view.dart';
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
              backgroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJrXSXb_jayac8vtbpTX_FYximkklGxSWZgA&usqp=CAU"),
            ),
            const HorizontalSpacing(2),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Mohammed Rashed",
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(text: "079656533"),
              ],
            ),
          ],
        ),
        const VerticalSpacing(4),
        // Row(
        //   children: [
        //     TextWidget(
        //       text: "Cars To Rent",
        //       fontWeight: FontWeight.w900,
        //       fontSize: 14.sp,
        //     ),
        //     const Spacer(),
        //     CustomTextButtons(
        //       onPressed: () {},
        //       text: "see more",
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: 23.h,
        //   child: ListView.separated(
        //     physics: const BouncingScrollPhysics(),
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         width: 40.w,
        //         padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(30),
        //             color: AppColors.myGrey),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               height: 13.h,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(30),
        //                   color: AppColors.myGrey,
        //                   image: const DecorationImage(
        //                       fit: BoxFit.cover,
        //                       image: NetworkImage(
        //                           "https://www.kia.com/content/dam/kwcms/gt/en/images/showroom/Niro-SG2-23MY/Features/safety/safety-01-HDA.jpg"))),
        //             ),
        //             const VerticalSpacing(0.5),
        //             TextWidget(
        //               text: "Kia Nero",
        //               fontWeight: FontWeight.bold,
        //               fontSize: 11.sp,
        //             ),
        //             TextWidget(
        //               text: "green",
        //               fontWeight: FontWeight.normal,
        //               fontSize: 10.sp,
        //               textColor: Colors.grey,
        //             ),
        //             TextWidget(
        //               text: "10 JOD per day",
        //               fontWeight: FontWeight.normal,
        //               fontSize: 10.sp,
        //               textColor: AppColors.primaryColor,
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) => const HorizontalSpacing(2),
        //     itemCount: 6,
        //   ),
        // ),
        // const VerticalSpacing(2),
        TextWidget(
          text: "Services",
          fontWeight: FontWeight.w900,
          fontSize: 14.sp,
        ),
        VerticalSpacing(1),
        Row(
          children: [
            InkWell(
              onTap: (){
                navigateTo(context, HomeServicesView());
              },
              child: Container(
                height: 30.h,
                width: 45.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.myGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/plan.png",
                      height: 10.h,
                    ),
                    const TextWidget(
                      text: "Maple Services",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            const HorizontalSpacing(2),
            Column(
              children: [
                Container(
                  height: 30.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.myGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/field.png",
                        height: 10.h,
                      ),
                      const TextWidget(
                          text: "Fields", fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                // const VerticalSpacing(
                //   2,
                //   width: 0,
                // ),
                // Container(
                //   height: 14.h,
                //   width: 45.w,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color: AppColors.myGrey,
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.asset(
                //         "assets/images/car.png",
                //         height: 10.h,
                //       ),
                //       const TextWidget(
                //           text: "Cars", fontWeight: FontWeight.bold),
                //     ],
                //   ),
                // ),

              ],
            ),

          ],
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Advertisements",
          fontWeight: FontWeight.w900,
          fontSize: 14.sp,
        ),
        VerticalSpacing(1),
        CarouselSlider(
          items: List.generate(
            5,
                (index) => Container(
              width: 70.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRGwUzGOSuG2eZPpdlwBfKVzLnZhG22ysQzyori1rhvejUPrLjCbZVNmvbkhtBzEI3R9g&usqp=CAU"),
                  )
              ),
            ),),
          options: CarouselOptions(
              height: 20.h,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.8

          ),
        ),
        VerticalSpacing(5),
      ],
    );
  }
}
