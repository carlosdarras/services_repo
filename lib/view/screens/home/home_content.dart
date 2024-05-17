import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/football_fields_section/football_fields_section_view.dart';
import 'package:services_repo/view/screens/home_services_section/home_services_view.dart';
import 'package:services_repo/view/tools.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          // alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF53565c),
                  Color(0xFF0e0e0e),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Mohammed Rashid",
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            TextWidget(
                              text: "0797975052",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: AppColors.myGrey,
                          radius: 20.sp,
                          backgroundImage: const NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/services-repo-535bc.appspot.com/o/WhatsApp%20Image%202024-04-16%20at%209.48.05%20PM.jpeg?alt=media&token=b67bee69-34f9-4108-b46a-f8b6e55c2286"),
                        ),
                      ],
                    ),
                    const VerticalSpacing(3),
                    TextWidget(
                      text: "Welcome to MAPLE",
                      textColor: Colors.grey[300],
                      fontSize: 11.sp,
                    ),
                    const VerticalSpacing(1),
                    TextWidget(
                      text: "Discover Our Services",
                      textColor: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    const VerticalSpacing(2),
                    TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1.6.h),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.5),
                        hintText: "Search Here...",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                            gapPadding: 3.h),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                          gapPadding: 1.h,
                        ),
                      ),
                    ),
                    const VerticalSpacing(3),
                    const TextWidget(
                      text: "Popular Fields 🔥",
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                    const VerticalSpacing(1),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -17.h,
              child: SizedBox(
                height: 29.h,
                width: 100.w,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return Container(
                      width: 60.w,
                      height: 28.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 11)
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1556056504-5c7696c4c28d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vdGJhbGwlMjBmaWVsZHxlbnwwfHwwfHx8MA%3D%3D"),
                                )),
                          ),
                          const VerticalSpacing(0.7),
                          const TextWidget(
                            text: "Khalda Fields",
                            fontWeight: FontWeight.w800,
                          ),
                          const VerticalSpacing(0.7),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 12.sp,
                                color: Colors.deepOrange,
                              ),
                              const HorizontalSpacing(2),
                              TextWidget(
                                text: "every day",
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                          const VerticalSpacing(0.7),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 12.sp,
                                color: Colors.deepOrange,
                              ),
                              const HorizontalSpacing(2),
                              TextWidget(
                                text: "Khalda",
                                fontSize: 10.sp,
                              ),
                              const HorizontalSpacing(2),
                              const TextWidget(text: "|"),
                              const HorizontalSpacing(2),
                              Icon(
                                Icons.monetization_on,
                                size: 12.sp,
                                color: Colors.deepOrange,
                              ),
                              const HorizontalSpacing(2),
                              TextWidget(
                                text: "100 JD",
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const HorizontalSpacing(3),
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpacing(19),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const TextWidget(
            text: "Categories",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[300]!, blurRadius: 11)
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 11.w,
                      child: Center(
                        child: Image.asset(
                          AppAssets.plumbingIcon,
                          height: 3.h,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const HorizontalSpacing(2),
                    TextWidget(
                      text: "Plumbing",
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const HorizontalSpacing(3),
            itemCount: 4,
          ),
        ),
        const VerticalSpacing(2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const TextWidget(
            text: "Main Services",
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacing(1),
        CarouselSlider(
            items: [
              InkWell(
                onTap: () {
                  navigateTo(context, const HomeServicesView());
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
                  navigateTo(context, const FootballFieldsSectionView());
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
        const VerticalSpacing(10),
      ],
    );
  }
}
