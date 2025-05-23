import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/features/auth/ui/screens/login_screen.dart';
import 'package:droosy_app/features/auth/ui/screens/register_screen.dart';
import 'package:droosy_app/features/home/ui/screens/default_home_screen.dart';
import 'package:droosy_app/features/home/ui/screens/teacher_home_screen.dart';
import 'package:droosy_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:droosy_app/features/splash/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(name: AppRoutes.home, page: () => DefaultHomeScreen()),
    GetPage(name: AppRoutes.teacherHome, page: () => TeacherHomeScreen()),
  ];
}
