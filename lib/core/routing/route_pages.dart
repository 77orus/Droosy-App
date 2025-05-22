import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/features/splash/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  ];
}
