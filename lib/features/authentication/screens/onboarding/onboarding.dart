import 'package:applichiamoci/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_languaje_page.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
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
            children: [
              const LanguajePage(),
              OnBoardingPage(
                image: LImages.onBoardingImage1,
                title: tr(LocaleKeys.onBoardingTitle1),
                subTitle: tr(LocaleKeys.onBoardingSubTitle1),
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage2,
                title: tr(LocaleKeys.onBoardingTitle2),
                subTitle: tr(LocaleKeys.onBoardingSubTitle2),
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage3,
                title: tr(LocaleKeys.onBoardingTitle3),
                subTitle: tr(LocaleKeys.onBoardingSubTitle3),
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
