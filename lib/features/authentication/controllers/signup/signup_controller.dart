import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/data/repositories/user/user_repository.dart';
import 'package:applichiamoci/features/authentication/models/user_model.dart';
import 'package:applichiamoci/features/authentication/screens/signup/verify_email.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/network_manager.dart';
import 'package:applichiamoci/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // observable fo
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();

  // SignUp
  void signup() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          LTexts.processingInformation, LImages.checkInformation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        // Mostrar mensaje de error al usuario
        LLoaders.errorSnackBar(title: LTexts.error, message: LTexts.noInternet);
        return;
      }

      // Form Validation
      if (!signupFromKey.currentState!.validate()) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (privacyPolicy.value) {
        LLoaders.warningSnackBar(
          title: LTexts.acceptPrivacyPolicy,
          message: LTexts.messagePrivacyPolicy,
        );
        LFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // Remove loader
      LFullScreenLoader.stopLoading();

      // Show success message
      LLoaders.successSnackBar(
          title: LTexts.congratulations,
          message: LTexts.accountCreatedSuccessfully);

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      LFullScreenLoader.stopLoading();

      // show some generic error to the user
      LLoaders.errorSnackBar(title: LTexts.error, message: e.toString());
    }
  }
}
