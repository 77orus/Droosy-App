import 'package:droosy_app/features/home/ui/widgets/categories_section.dart';
import 'package:droosy_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:droosy_app/features/home/ui/widgets/home_search_bar_widget.dart';
import 'package:droosy_app/features/home/ui/widgets/in_progress_course_section.dart';
import 'package:droosy_app/features/home/ui/widgets/recommended_section.dart';
import 'package:flutter/material.dart';

class DefaultHomeScreen extends StatelessWidget {
  const DefaultHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const HomeSearchBarWidget(),
              const SizedBox(height: 32),
              const CategoriesSection(),
              const SizedBox(height: 32),
              const InProgressCoursesSection(),
              const RecommendedSection(),
            ]),
          ),
        ),
      ],
    );
  }
}

// final inProgressCoursess =
//     DummyData.courses
//         .where(
//           (course) =>
//               course.lessons.any((lesson) => lesson.isCompleted) &&
//               !course.lesson.every((lesson) => lesson.isCompleted),
//         )
//         .toList();
