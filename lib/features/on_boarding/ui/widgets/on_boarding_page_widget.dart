import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/on_boarding/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final OnBoardingItemsModel pageModel;
  const OnBoardingPageWidget({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Image
            Container(
              height: Get.height * 0.5,
              padding: EdgeInsets.all(32),
              child: Image.asset(pageModel.image, fit: BoxFit.contain),
            ),
            //! Title
            Text(
              pageModel.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            //! Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                pageModel.description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
