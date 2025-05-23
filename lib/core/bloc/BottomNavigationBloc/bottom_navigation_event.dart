abstract class BottomNavigationEvent {}

class NavigationToTapEvent extends BottomNavigationEvent {
  final int index;
  NavigationToTapEvent(this.index);
}