import 'package:droosy_app/core/bloc/BottomNavigationBloc/bottom_navigation_event.dart';
import 'package:droosy_app/core/bloc/BottomNavigationBloc/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState(0)) {
    on<NavigationToTapEvent>((event, emit) {
      emit(BottomNavigationState(event.index));
    });
  }
}
