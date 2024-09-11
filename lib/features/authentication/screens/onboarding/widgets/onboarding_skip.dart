import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: LDeviceUtils.getAppBarHeight(),
        right: LSizes.defaultSpace,
        child: TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: const Text('Skip'),
        ));
  }
}
