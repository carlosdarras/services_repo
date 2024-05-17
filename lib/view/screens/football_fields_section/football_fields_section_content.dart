import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/field_details/fields_details_view.dart';
import 'package:services_repo/view/tools.dart';

class FootballFieldsSectionContent extends StatelessWidget {
  const FootballFieldsSectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "Mohammad",
                    style: GoogleFonts.openSans().copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rashed",
                    style: GoogleFonts.openSans().copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 20.h,
                width: 25.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/services-repo-535bc.appspot.com/o/WhatsApp%20Image%202024-04-16%20at%209.48.05%20PM.jpeg?alt=media&token=b67bee69-34f9-4108-b46a-f8b6e55c2286"),
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
                navigateTo(context, FieldsDetailsView());
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1556056504-5c7696c4c28d?q=80&w=3257&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSpacing(1),
                    TextWidget(
                      text: "Jordan University Fields",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    const VerticalSpacing(0.5),
                    TextWidget(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
                        HorizontalSpacing(1),
                        TextWidget(
                          text: "9:00 AM - 9:00 PM",
                          fontSize: 10.sp,
                        ),
                        TextWidget(text: " | "),
                        Icon(
                          Icons.monetization_on,
                          size: 12.sp,
                          color: Colors.deepOrange,
                        ),
                        HorizontalSpacing(1),
                        TextWidget(
                          text: "25 - 70 JOD",
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
                        HorizontalSpacing(1),
                        TextWidget(
                          text: "Khalda",
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
          itemCount: 10,
        )
      ],
    );
  }
}
