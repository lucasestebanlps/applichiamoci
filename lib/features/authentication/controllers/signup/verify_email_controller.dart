import 'dart:async';

import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/common/widgets/success_screen/success_screen.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      LLoaders.warningSnackBar(
          title: tr(LocaleKeys.emailSentTitle),
          message: tr(LocaleKeys.verifyEmail));
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: LImages.succsesfullyRegisterAnimation,
            title: tr(LocaleKeys.yourAccountCreatedTitle),
            subTitle: tr(LocaleKeys.yourAccountCreatedSubTitle),
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  // Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: LImages.succsesfullyRegisterAnimation,
          title: tr(LocaleKeys.yourAccountCreatedTitle),
          subTitle: tr(LocaleKeys.yourAccountCreatedSubTitle),
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
