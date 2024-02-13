import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/helpers/network_manager.dart';
import 'package:applichiamoci/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'Loggin you in...', LImages.checkInformation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        // Mostrar mensaje de error al usuario
        LLoaders.errorSnackBar(
            title: 'Error!',
            message: 'No internet connection. Please check your connection.');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Remove loader
      LFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      LFullScreenLoader.stopLoading();
      // show some generic error to the user
      LLoaders.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }

  // Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'Loggin you in...', LImages.checkInformation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        // Mostrar mensaje de error al usuario
        LLoaders.errorSnackBar(
            title: 'Error!',
            message: 'No internet connection. Please check your connection.');
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Stop loader
      LFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
