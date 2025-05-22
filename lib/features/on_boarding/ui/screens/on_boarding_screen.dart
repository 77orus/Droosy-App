import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/on_boarding/models/on_boarding_model.dart';
import 'package:droosy_app/features/on_boarding/ui/widgets/on_boarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  List<OnBoardingItemsModel> onBoardingItems = [
    OnBoardingItemsModel(
      image: "assets/images/onboarding1.png",
      title: "Learn Everywhere",
      description:
          "Access Your Courses Anytime, anywhere. Learn on your own pace with our flexible learning platform",
    ),
    OnBoardingItemsModel(
      image: "assets/images/onboarding2.png",
      title: "Interactive Learning",
      description:
          "Engage with interactive quizzes, live session, and hands-on projects",
    ),
    OnBoardingItemsModel(
      image: "assets/images/onboarding3.png",
      title: "Track Progress",
      description:
          "Monitor your progress, earn certificates, and achive your learning goals",
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //! page View
          PageView.builder(
            controller: pageController,
            itemCount: onBoardingItems.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPageWidget(pageModel: onBoardingItems[index]);
            },
          ),
          //! Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => Get.offAllNamed(AppRoutes.login),
            ),
          ),
          //! Indicator and Button
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! Indicator
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingItems.length,
                  effect: WormEffect(
                    dotColor: Colors.white70,
                    spacing: 8,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                //! Next&Get started Button
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == onBoardingItems.length - 1) {
                      Get.offAllNamed(AppRoutes.login);
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    currentIndex == onBoardingItems.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
