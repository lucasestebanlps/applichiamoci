import 'package:applichiamoci/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        // Horizontal scrollable pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator, 
          children: const [
          OnBoardingPage(
            image: LImages.onBoardingImage1,
            title: LTexts.onBoardingTitle1,
            subTitle: LTexts.onBoardingSubTitle1,
          ),
          OnBoardingPage(
            image: LImages.onBoardingImage2,
            title: LTexts.onBoardingTitle2,
            subTitle: LTexts.onBoardingSubTitle2,
          ),
          OnBoardingPage(
            image: LImages.onBoardingImage3,
            title: LTexts.onBoardingTitle3,
            subTitle: LTexts.onBoardingSubTitle3,
          ),
        ]),

        //  Skip Button
        const OnBoardingSkip(),

        // Dot navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        // Circular button
        const OnBoardingNextbutton()
      ],
    ));
  }
}
