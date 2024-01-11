import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/features/authentication/screens/onboarding/onboarding.dart';
import 'package:applichiamoci/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/format_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);

    // Check if its the first time launching app
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  // ----------------- Email & password sign-in -----------------

  // [EmailAuthentication] - SignIn

  // [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethign went wrong. Please try again';
    }
  }

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
