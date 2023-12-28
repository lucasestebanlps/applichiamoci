import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();


  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('===========GET STORAGE============');
      print(deviceStorage.read('ISFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  // ----------------- Email & password sign-in -----------------

  // [EmailAuthentication] - SignIn

  // [EmailAuthentication] - Register

  // [ReAuthenticate] - ReAuthentiucate User

  // [EmailVerification] - Mail Verification

  // [EmailAuthentication] - Forget Password

  // -----------------Federated identity & social sign-in -----------------

  // [GoogleAuthentication] - Google

  // [FacebookAuthentication] - Facebook

  // -----------------Federated identity & social sign-in -----------------

  // [LogoutUser] - Void for any authentication

  // DELETE USER - Remove user auth and firestore account
}
