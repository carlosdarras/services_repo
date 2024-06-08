import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/blocs/home_services_section/home_services_section_bloc.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/view/tools.dart';

class MyRequestsContent extends StatelessWidget {
  const MyRequestsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeServicesBloc = context.read<HomeServicesSectionBloc>();
    var homeServicesBlocListener = context.watch<HomeServicesSectionBloc>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      children: [
        homeServicesBlocListener.state is HomeServicesGetAllRequestLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(context.read<MainBloc>().userInfoModel!.id)
                    .collection("requests")
                    .snapshots(),
                builder: (context, snapshot) {
                  // List<OrderModel>model =[];
                  // for(var e in snapshot.data!.docs){
                  //   model.add(OrderModel.fromJson(e.data(), e.id));
                  // }
                  if (snapshot.data != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.myGrey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "#${data['serviceId']}",
                                fontWeight: FontWeight.w900,
                                fontSize: 14.sp,
                              ),
                              const VerticalSpacing(1),
                              Row(
                                children: [
                                  const TextWidget(
                                    text: "Service:",
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColors.primaryColor,
                                  ),
                                  const HorizontalSpacing(2),
                                  TextWidget(
                                    text: data['serviceName'],
                                    fontSize: 10.sp,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const TextWidget(
                                    text: "info:",
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColors.primaryColor,
                                  ),
                                  const HorizontalSpacing(2),
                                  TextWidget(
                                    text: data['info'],
                                    fontSize: 10.sp,
                                    maxLines: 40,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const TextWidget(
                                    text: "reason:",
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColors.primaryColor,
                                  ),
                                  const HorizontalSpacing(2),
                                  TextWidget(
                                    text: data['reason']?? "",
                                    fontSize: 10.sp,
                                    maxLines: 40,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const TextWidget(
                                    text: "time:",
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColors.primaryColor,
                                  ),
                                  const HorizontalSpacing(2),
                                  TextWidget(
                                    text: data['timeFrom'],
                                    fontSize: 10.sp,
                                  ),
                                ],
                              ),
                              TextWidget(
                                text: data['isAccept'] == 0
                                    ? "Pending"
                                    : data['isAccept'] == 1
                                        ? "Accepted"
                                        : "Rejected",
                                textColor: data['isAccept'] == 0
                                    ? Colors.grey
                                    : data['isAccept'] == 1
                                        ? Colors.green
                                        : Colors.red,
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const VerticalSpacing(1),
                      itemCount: snapshot.data!.docs.length,
                    );
                  } else {
                    return Container();
                  }
                }),
      ],
    );
  }
}
