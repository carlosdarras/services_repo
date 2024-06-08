import 'package:flutter/material.dart';
import 'package:services_repo/blocs/football_bloc/football_bloc.dart';
import 'package:services_repo/data/models/footballFieldModel.dart';
import 'package:services_repo/view/common_widgets/start_end_time_field.dart';
import 'package:services_repo/view/tools.dart';

class FieldsDetailsContent extends StatelessWidget {
  const FieldsDetailsContent({Key? key, required this.footballFieldModel})
      : super(key: key);
  final FootballFieldModel footballFieldModel;

  @override
  Widget build(BuildContext context) {
    var field = context.read<FootballBloc>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      children: [
        Container(
          height: 20.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.myGrey,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(footballFieldModel.image!),
            ),
          ),
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: footballFieldModel.name!,
          fontSize: 15.sp,
          fontWeight: FontWeight.w900,
        ),
        const VerticalSpacing(1),
        TextWidget(
          text: footballFieldModel.description!,
          fontSize: 11.sp,
          maxLines: 5,
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            Icon(
              Icons.timer,
              size: 14.sp,
              color: Colors.deepOrange,
            ),
            const HorizontalSpacing(1),
            TextWidget(
              text:
                  "Work Time ${footballFieldModel.openHours} to ${footballFieldModel.closeHours}",
              fontSize: 10.sp,
            ),
          ],
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 14.sp,
              color: Colors.deepOrange,
            ),
            const HorizontalSpacing(1),
            TextWidget(
              text: footballFieldModel.location!,
              fontSize: 10.sp,
            ),
          ],
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Date & Time",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        // SizedBox(
        //   height: 10.h,
        //   child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         width: 14.w,
        //         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20),
        //           color: AppColors.myGrey,
        //         ),
        //         child: Column(
        //           children: [
        //             TextWidget(
        //               text: "Sun",
        //               fontSize: 10.sp,
        //             ),
        //             const TextWidget(
        //               text: "29",
        //               fontWeight: FontWeight.w900,
        //               textColor: AppColors.primaryColor,
        //             ),
        //             TextWidget(
        //               text: "Sep",
        //               fontSize: 10.sp,
        //             ),
        //           ],
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) => const HorizontalSpacing(2),
        //     itemCount: 10,
        //   ),
        // ),
        const VerticalSpacing(2),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "Start"),
                  const VerticalSpacing(1),
                  StartEndTimeField(
                    hintText: "Start",
                    controller: TextEditingController(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const HorizontalSpacing(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "End"),
                  const VerticalSpacing(1),
                  StartEndTimeField(
                    hintText: "End",
                    controller: TextEditingController(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        const VerticalSpacing(2),
        ActionButton(
          onPressed: () {},
          text: "Reserve",
          fontWight: FontWeight.bold,
        )
      ],
    );
  }
}
