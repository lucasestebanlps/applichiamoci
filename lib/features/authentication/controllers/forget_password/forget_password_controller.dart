import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/helpers/network_manager.dart';
import 'package:applichiamoci/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get insstance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'Loggin you in...', LImages.checkInformation);

      // Check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetemail(email.text.trim());

      // Remove Loader
      LFullScreenLoader.stopLoading();

      // Show succsess  message
      LLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
      try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'Loggin you in...', LImages.checkInformation);

      // Check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetemail(email);

      // Remove Loader
      LFullScreenLoader.stopLoading();

      // Show succsess  message
      LLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.'.tr);


    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}

