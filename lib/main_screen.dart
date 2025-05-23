import 'package:droosy_app/core/bloc/BottomNavigationBloc/bottom_navigation_bloc.dart';
import 'package:droosy_app/core/bloc/BottomNavigationBloc/bottom_navigation_event.dart';
import 'package:droosy_app/core/bloc/BottomNavigationBloc/bottom_navigation_state.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/courses/ui/screens/courses_screen.dart';
import 'package:droosy_app/features/home/ui/screens/default_home_screen.dart';
import 'package:droosy_app/features/profile/ui/screens/profile_screen.dart';
import 'package:droosy_app/features/quizzes/ui/screens/quizzes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  final int? initialIndex;
  const MainScreen({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              BottomNavigationBloc()
                ..add(NavigationToTapEvent(initialIndex ?? 0)),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: IndexedStack(
              index: state.currendIndex,
              children: [
                DefaultHomeScreen(),
                CoursesScreen(),
                QuizzesScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.accent,
              indicatorColor: AppColors.primary.withOpacity(0.1),

              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_lesson_outlined),
                  selectedIcon: Icon(Icons.play_lesson),
                  label: 'My Courses',
                ),
                NavigationDestination(
                  icon: Icon(Icons.quiz_outlined),
                  selectedIcon: Icon(Icons.quiz),
                  label: 'Quizzes',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_2_outlined),
                  selectedIcon: Icon(Icons.person_2),
                  label: 'Profile',
                ),
              ],
              selectedIndex: state.currendIndex,
              onDestinationSelected: (index) {
                context
                    .read<BottomNavigationBloc>()
                    .add(NavigationToTapEvent(index));
              },
            ),
          );
        },
      ),
    );
  }
}
