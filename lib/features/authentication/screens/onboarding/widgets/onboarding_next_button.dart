import 'package:applichiamoci/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/device/device_utility.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextbutton extends StatelessWidget {
  const OnBoardingNextbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Positioned(
        right: LSizes.defaultSpace,
        bottom: LDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? LColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
