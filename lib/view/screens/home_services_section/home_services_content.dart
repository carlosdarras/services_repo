import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/companies_section/companies_section_view.dart';
import 'package:services_repo/view/tools.dart';


List<String> services =[
  "Plumping",
  "Electrical",
  "Cleaning",
];
class HomeServicesContent extends StatelessWidget {
  const HomeServicesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      children: [
        // SizedBox(
        //   height: 6.h,
        //   child: ListView.separated(
        //     physics: const BouncingScrollPhysics(),
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context,index){
        //         return Container(
        //           height: 7.h,
        //           width: 40.w,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: AppColors.myGrey,
        //           ),
        //           child: Center(
        //             child:TextWidget(text: services[index],fontWeight: FontWeight.bold,),
        //           ),
        //         );
        //       },
        //       separatorBuilder: (context,index)=>const HorizontalSpacing(2),
        //       itemCount: 3,
        //   ),
        // ),
        // const VerticalSpacing(3),
        Row(
          children: [
            TextWidget(
              text: "Plumbing Services",
              fontWeight: FontWeight.w900,
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
              return InkWell(
                onTap: (){
                  navigateTo(context, const CompaniesSectionView());
                },
                child: Container(
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
                            color: AppColors.myGrey,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-vector/plumber-plumbing-service-professional-repair-cleaning-bathroom-equipment-sewerage-systems-vector-illustration_613284-1913.jpg?size=626&ext=jpg&ga=GA1.2.926676624.1704345251&semt=ais"))),
                      ),
                      const VerticalSpacing(0.5),
                      TextWidget(
                        text: "Services Name",
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                      ),
                      TextWidget(
                        text: "type",
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        textColor: Colors.grey,
                      ),
                      TextWidget(
                        text: "10 JOD ",
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        textColor: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const HorizontalSpacing(2),
            itemCount: 6,
          ),
        ),
        const VerticalSpacing(3),
        CarouselSlider(
          items: List.generate(
            5,
                (index) => Container(
              width: 70.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:  NetworkImage("https://img.freepik.com/free-psd/electrical-services-landing-page-design_23-2148652444.jpg?size=626&ext=jpg&ga=GA1.2.926676624.1704345251&semt=ais"),
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
        const VerticalSpacing(3),
        Row(
          children: [
            TextWidget(
              text: "Electrical Services",
              fontWeight: FontWeight.w900,
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
                          color: AppColors.myGrey,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://img.freepik.com/free-photo/man-electrical-technician-working-switchboard-with-fuses_169016-24062.jpg?size=626&ext=jpg&ga=GA1.2.926676624.1704345251&semt=ais"))),
                    ),
                    const VerticalSpacing(0.5),
                    TextWidget(
                      text: "Services Name",
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                    TextWidget(
                      text: "type",
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      textColor: Colors.grey,
                    ),
                    TextWidget(
                      text: "10 JOD ",
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
        const VerticalSpacing(3),
        Row(
          children: [
            TextWidget(
              text: "Cleaning services",
              fontWeight: FontWeight.w900,
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
                          color: AppColors.myGrey,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://img.freepik.com/free-vector/flat-design-handyman-logo_23-2149239540.jpg?size=626&ext=jpg"))),
                    ),
                    const VerticalSpacing(0.5),
                    TextWidget(
                      text: "Services Name",
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                    TextWidget(
                      text: "type",
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      textColor: Colors.grey,
                    ),
                    TextWidget(
                      text: "10 JOD",
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
      ],
    );
  }
}
