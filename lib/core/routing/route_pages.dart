import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/features/auth/ui/screens/forgot_password_Screen.dart';
import 'package:droosy_app/features/auth/ui/screens/login_screen.dart';
import 'package:droosy_app/features/auth/ui/screens/register_screen.dart';
import 'package:droosy_app/features/courses/ui/screens/course_details_screen.dart';
import 'package:droosy_app/features/courses/ui/screens/courses_screen.dart';
import 'package:droosy_app/features/courses/ui/screens/payment_screen.dart';
import 'package:droosy_app/features/home/ui/screens/default_home_screen.dart';
import 'package:droosy_app/features/home/ui/screens/teacher_home_screen.dart';
import 'package:droosy_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:droosy_app/features/profile/ui/screens/profile_screen.dart';
import 'package:droosy_app/features/quizzes/ui/screens/quizzes_screen.dart';
import 'package:droosy_app/features/splash/ui/screens/splash_screen.dart';
import 'package:droosy_app/main_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page:
          () => MainScreen(
            initialIndex:
                Get.arguments is Map<String, dynamic>
                    ? Get.arguments['initialIndex']
                    : null,
          ),
    ),
    GetPage(name: AppRoutes.quizzes, page: () => const QuizzesScreen()),
    GetPage(name: AppRoutes.courses, page: () => const CoursesScreen()),
    GetPage(
      name: AppRoutes.courseDetails,
      page: () => const CourseDetailsScreen(),
    ),
    GetPage(name: AppRoutes.payment, page: () => const PaymentScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.home, page: () => const DefaultHomeScreen()),
    GetPage(name: AppRoutes.teacherHome, page: () => const TeacherHomeScreen()),
  ];
}
