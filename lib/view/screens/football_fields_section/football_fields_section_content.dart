import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_repo/blocs/football_bloc/football_bloc.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/field_details/fields_details_view.dart';
import 'package:services_repo/view/tools.dart';

class FootballFieldsSectionContent extends StatelessWidget {
  const FootballFieldsSectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    var fieldBloc = context.read<FootballBloc>();
    return ListView(
      // padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 27.h,
          width: double.infinity,
          padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 7.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF53565c),
                Color(0xFF0e0e0e),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "#99",
                    fontWeight: FontWeight.w900,
                    fontSize: 17.sp,
                    textColor: Colors.amber,
                  ),
                  const VerticalSpacing(
                    2,
                    width: 0,
                  ),
                  Text(
                    mainBloc.userInfoModel!.name!,
                    style: GoogleFonts.openSans().copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   "Rashed",
                  //   style: GoogleFonts.openSans().copyWith(
                  //       color: Colors.white,
                  //       fontSize: 20.sp,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
              const Spacer(),
              Container(
                height: 20.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(mainBloc.userInfoModel!.image!),
                  ),
                ),
              )
            ],
          ),
        ),
        const VerticalSpacing(2),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                navigateTo(
                    context,
                    FieldsDetailsView(
                      footballFieldModel: fieldBloc.footballFieldModel[index],
                    ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 11),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              fieldBloc.footballFieldModel[index].image!),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSpacing(1),
                    TextWidget(
                      text: fieldBloc.footballFieldModel[index].name!,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    const VerticalSpacing(0.5),
                    TextWidget(
                      text: fieldBloc.footballFieldModel[index].description!,
                      maxLines: 2,
                      fontSize: 10.sp,
                      textColor: Colors.grey,
                    ),
                    const VerticalSpacing(0.5),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 12.sp,
                          color: Colors.deepOrange,
                        ),
                        const HorizontalSpacing(1),
                        TextWidget(
                          text:
                              "${fieldBloc.footballFieldModel[index].openHours} - ${fieldBloc.footballFieldModel[index].closeHours}",
                          fontSize: 10.sp,
                        ),
                        const TextWidget(text: " | "),
                        Icon(
                          Icons.monetization_on,
                          size: 12.sp,
                          color: Colors.deepOrange,
                        ),
                        const HorizontalSpacing(1),
                        TextWidget(
                          text:
                              "${fieldBloc.footballFieldModel[index].minPrice} - ${fieldBloc.footballFieldModel[index].maxPrice} JOD",
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                    const VerticalSpacing(0.5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12.sp,
                          color: Colors.deepOrange,
                        ),
                        const HorizontalSpacing(1),
                        TextWidget(
                          text: fieldBloc.footballFieldModel[index].location!,
                          fontSize: 10.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const VerticalSpacing(2),
          itemCount: fieldBloc.footballFieldModel.length,
        )
      ],
    );
  }
}
