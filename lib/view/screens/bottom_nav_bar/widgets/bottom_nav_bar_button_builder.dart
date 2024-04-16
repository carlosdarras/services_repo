import 'package:flutter/material.dart';

import 'package:rive/rive.dart';
import 'package:services_repo/blocs/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';

import 'package:services_repo/view/tools.dart';


class BottomNavBarButtonBuilder extends StatelessWidget {
  const BottomNavBarButtonBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BottomNavigationBarBloc>(context);
    return InkWell(
      onTap: () {
        if (bloc.bottomNavIcons[index] != bloc.selectedBottomNav) {
          bloc.add(BottomNavigationBarSelectIcon(index));
        }
        bloc.bottomNavIcons[index].input!.change(true);
        Future.delayed(const Duration(seconds: 1), () {
          bloc.bottomNavIcons[index].input!.change(false);
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 0.3.h,
            margin: EdgeInsets.only(bottom: 0.1.h),
            width: bloc.bottomNavIcons[index] ==
                    context.watch<BottomNavigationBarBloc>().selectedBottomNav
                ? 5.w
                : 0,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: bloc.bottomNavIcons[index] == bloc.selectedBottomNav
                  ? 1
                  : 0.5,
              child: RiveAnimation.asset(
                bloc.bottomNavIcons.first.src,
                artboard: bloc.bottomNavIcons[index].artboard,
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachine:
                              bloc.bottomNavIcons[index].stateMachineName);
                  bloc.bottomNavIcons[index].input =
                      controller.findSMI("active") as SMIBool;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
