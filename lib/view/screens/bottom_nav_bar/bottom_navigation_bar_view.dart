import 'package:flutter/material.dart';
import 'package:services_repo/blocs/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:services_repo/view/screens/bottom_nav_bar/widgets/bottom_nav_bar_button_builder.dart';
import 'package:services_repo/view/tools.dart';


class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<BottomNavigationBarBloc>(context);
          return Scaffold(
            body: Stack(
              children: [
                bloc.screens[bloc.currentIndex],
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 0.9.h),
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2f3344),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottomNavBarButtonBuilder(index: 0),
                          BottomNavBarButtonBuilder(index: 1),
                          // BottomNavBarButtonBuilder(index: 2),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
