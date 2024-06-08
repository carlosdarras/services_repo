import 'package:flutter/material.dart';
import 'package:services_repo/blocs/home_services_section/home_services_section_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/upload_request_info/upload_request_info.dart';
import 'package:services_repo/view/tools.dart';

class CompaniesSectionContent extends StatelessWidget {
  const CompaniesSectionContent({Key? key, required this.serviceName})
      : super(key: key);
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    var homeServicesBloc = context.read<HomeServicesSectionBloc>();
    var homeServicesBlocListener = context.read<HomeServicesSectionBloc>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      children: [
        TextWidget(
          text: serviceName,
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
        BlocBuilder<HomeServicesSectionBloc, HomeServicesSectionState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    homeServicesBloc.selectedCompany =
                        homeServicesBloc.companies[index];
                    navigateTo(context, const UploadRequestInfo());
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
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
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  homeServicesBloc.companies[index].image!),
                            ),
                          ),
                        ),
                        const HorizontalSpacing(2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: homeServicesBloc.companies[index].name!,
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
                                  text: homeServicesBloc.companies[index].rate!,
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
                            // Row(
                            //   children: [
                            //     TextWidget(
                            //       text: "price:",
                            //       fontSize: 10.sp,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //     const HorizontalSpacing(2),
                            //     TextWidget(
                            //       text: "30-45 JD",
                            //       fontSize: 10.sp,
                            //     ),
                            //     HorizontalSpacing(1),
                            //     Icon(
                            //       Icons.monetization_on_outlined,
                            //       color: Colors.green,
                            //       size: 13.sp,
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const VerticalSpacing(2),
              itemCount: homeServicesBlocListener.companies.length,
            );
          },
        ),
      ],
    );
  }
}
