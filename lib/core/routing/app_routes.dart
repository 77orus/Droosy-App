import 'package:droosy_app/features/auth/ui/screens/forgot_password_Screen.dart';
import 'package:droosy_app/features/auth/ui/screens/login_screen.dart';
import 'package:droosy_app/features/auth/ui/screens/register_screen.dart';
import 'package:droosy_app/features/courses/ui/screens/courses_screen.dart';
import 'package:droosy_app/features/home/ui/screens/default_home_screen.dart';
import 'package:droosy_app/features/home/ui/screens/teacher_home_screen.dart';
import 'package:droosy_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:droosy_app/features/profile/ui/screens/profile_screen.dart';
import 'package:droosy_app/features/quizzes/ui/screens/quizzes_screen.dart';
import 'package:droosy_app/features/splash/ui/screens/splash_screen.dart';
import 'package:droosy_app/main_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Main Screen (Bottom Navigation Bar)
  static const String main = '/main';

  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';

  // Home
  static const String home = '/home';

  // Quizzes
  static const String quizzes = '/quizzes';

  // Courses
  static const String courses = '/courses';

  // Profile
  static const String profile = '/profile';

  // Teacher Routes
  static const String teacherHome = '/teacherHome';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case main:
        return MaterialPageRoute(
          builder:
              (_) => MainScreen(
                initialIndex:
                    settings.arguments is Map
                        ? (settings.arguments as Map)['initialIndex']
                        : null,
              ),
        );
      case quizzes:
        return MaterialPageRoute(builder: (_) => const QuizzesScreen());
      case courses:
        return MaterialPageRoute(builder: (_) => const CoursesScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const DefaultHomeScreen());
      case teacherHome:
        return MaterialPageRoute(builder: (_) => TeacherHomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
