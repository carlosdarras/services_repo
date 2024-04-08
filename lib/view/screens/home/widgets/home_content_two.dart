import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/view/tools.dart';

class HomeContentTwo extends StatelessWidget {
  const HomeContentTwo({Key? key}) : super(key: key);

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
        CarouselSlider(
          items: List.generate(
            5,
                (index) => Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRGwUzGOSuG2eZPpdlwBfKVzLnZhG22ysQzyori1rhvejUPrLjCbZVNmvbkhtBzEI3R9g&usqp=CAU"),
                ),
              ),
            ),
          ),
          options: CarouselOptions(
              height: 20.h,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.8),
        ),
        const VerticalSpacing(3),
        TextWidget(
          text: "Services",
          fontWeight: FontWeight.w900,
          fontSize: 14.sp,
        ),
        const VerticalSpacing(1),
        CarouselSlider(
            items: [
              InkWell(
                onTap: () {
                  // navigateTo(context, const CarsSectionView());
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.myGrey,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1554009975-d74653b879f1?q=80&w=2265&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Home Services",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            textColor: Colors.white,
                          ),
                          const VerticalSpacing(0.5),
                          TextWidget(
                            text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            textColor: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                            maxLines: 6,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  // navigateTo(context, const CarsSectionView());
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.myGrey,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1599158150601-1417ebbaafdd?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb3RiYWxsJTIwZmllbGR8ZW58MHx8MHx8fDA%3D")),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Football Fields",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            textColor: Colors.white,
                          ),
                          const VerticalSpacing(0.5),
                          TextWidget(
                            text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            textColor: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                            maxLines: 6,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
                height: 55.h,
                autoPlay: false,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 0.8)),
        const VerticalSpacing(2),
        const VerticalSpacing(5),
      ],
    );
  }
}
