import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:services_repo/core/constance/rive_assets.dart';
import 'package:services_repo/view/screens/home/home_view.dart';
import 'package:services_repo/view/screens/settings/settings_view.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    selectedBottomNav = bottomNavIcons.first;
    on<BottomNavigationBarSelectIcon>(_onBottomNavigationBarSelectIcon);
  }

  List<RiveAsset> bottomNavIcons = [
    RiveAsset("assets/images/icons.riv", "HOME", "HOME_interactivity", "Home"),
    // RiveAsset(
    //     "assets/images/icons.riv", "CHAT", "CHAT_Interactivity", "Chat"),
    RiveAsset(
        "assets/images/icons.riv", "USER", "USER_Interactivity", "Profile")
  ];

  late RiveAsset selectedBottomNav;

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    // const ChatView(),
    const SettingsView(),
  ];

  void _onBottomNavigationBarSelectIcon(
      BottomNavigationBarSelectIcon event,
      Emitter emit,
      ) async {
    print('the event is ${bottomNavIcons[event.index]}');
    currentIndex = event.index;
    selectedBottomNav = bottomNavIcons[event.index];
    bottomNavIcons[event.index].input!.change(true);
    Future.delayed(const Duration(seconds: 1), () {
      bottomNavIcons[event.index].input!.change(false);
    });

    emit(BottomNavigationBarChangeIndex());
  }
}
