import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/blocs/home_services_section/home_services_section_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/companies_section/companies_section_view.dart';
import 'package:services_repo/view/tools.dart';

List<String> services = [
  "Plumping",
  "Electrical",
  "Cleaning",
];

class HomeServicesContent extends StatelessWidget {
  const HomeServicesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeServiceBloc = context.read<HomeServicesSectionBloc>();
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
                onTap: () {
                  print('the id we send it is ${GetAllCompaniesByCategoryId(homeServiceBloc.categories[1].id!)}');
                  homeServiceBloc.add(GetAllCompaniesByCategoryId(homeServiceBloc.categories[1].id!));
                  homeServiceBloc.homeServiceSelected =
                      homeServiceBloc.categories[1];
                  navigateTo(
                    context,
                    CompaniesSectionView(
                      serviceName:
                          homeServiceBloc.categories[1].services[index].name!,
                    ),
                  );
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(homeServiceBloc
                                .categories[1].services[index].image!),
                          ),
                        ),
                      ),
                      const VerticalSpacing(0.5),
                      TextWidget(
                        text:
                            homeServiceBloc.categories[1].services[index].name!,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                      ),
                      TextWidget(
                        text: homeServiceBloc
                            .categories[1].services[index].description!,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        textColor: Colors.grey,
                      ),
                      TextWidget(
                        text:
                            "${homeServiceBloc.categories[1].services[index].minPrice} - ${homeServiceBloc.categories[1].services[index].maxPrice} JOD ",
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
            itemCount: homeServiceBloc.categories[1].services.length,
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
                    image: NetworkImage(
                        "https://img.freepik.com/free-psd/electrical-services-landing-page-design_23-2148652444.jpg?size=626&ext=jpg&ga=GA1.2.926676624.1704345251&semt=ais"),
                  )),
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
              return InkWell(
                onTap: () {
                  homeServiceBloc.add(GetAllCompaniesByCategoryId(homeServiceBloc.categories[2].id!));
                  homeServiceBloc.homeServiceSelected =
                      homeServiceBloc.categories[2];
                  navigateTo(
                    context,
                    CompaniesSectionView(
                      serviceName:
                          homeServiceBloc.categories[2].services[index].name!,
                    ),
                  );
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(homeServiceBloc
                                .categories[2].services[index].image!),
                          ),
                        ),
                      ),
                      const VerticalSpacing(0.5),
                      TextWidget(
                        text:
                            homeServiceBloc.categories[2].services[index].name!,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                      ),
                      TextWidget(
                        text: homeServiceBloc
                            .categories[2].services[index].description!,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        textColor: Colors.grey,
                      ),
                      TextWidget(
                        text:
                            "${homeServiceBloc.categories[2].services[index].minPrice} - ${homeServiceBloc.categories[2].services[index].maxPrice} JOD ",
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
            itemCount: homeServiceBloc.categories[2].services.length,
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
              return InkWell(
                onTap: () {
                  homeServiceBloc.add(GetAllCompaniesByCategoryId(homeServiceBloc.categories[0].id!));
                  homeServiceBloc.homeServiceSelected =
                      homeServiceBloc.categories[0];
                  navigateTo(
                    context,
                    CompaniesSectionView(
                      serviceName:
                          homeServiceBloc.categories[0].services[index].name!,
                    ),
                  );
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(homeServiceBloc
                                .categories[0].services[index].image!),
                          ),
                        ),
                      ),
                      const VerticalSpacing(0.5),
                      TextWidget(
                        text:
                            homeServiceBloc.categories[0].services[index].name!,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                      ),
                      TextWidget(
                        text: homeServiceBloc
                            .categories[0].services[index].description!,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        textColor: Colors.grey,
                      ),
                      TextWidget(
                        text:
                            "${homeServiceBloc.categories[0].services[index].minPrice} - ${homeServiceBloc.categories[0].services[index].maxPrice} JOD ",
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
            itemCount: homeServiceBloc.categories[0].services.length,
          ),
        ),
      ],
    );
  }
}
