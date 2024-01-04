part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {}


class BottomNavigationBarSelectIcon extends BottomNavigationBarEvent {
  final int index;

  BottomNavigationBarSelectIcon(this.index);
}
