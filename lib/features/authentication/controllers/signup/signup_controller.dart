import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
}

// Variables
final firstName = TextEditingController();
final lastName = TextEditingController();
final email = TextEditingController();
final userName = TextEditingController();
final password = TextEditingController();
final phoneNumber = TextEditingController();
GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();

// SignUp

Future<void> signup() async {
  try {
    // Start Loading
    // Check internet conectivity
    // Form Validation
    // Privacy Policy Check
    // Register user in the Firebase Authentication & save user data in the Firebase
    // Sabe Authenticated user data in the firebase Firestore
    // Show success message
    // Move to verify email screen
  } catch (e) {
    // show some generic error to the user
  } finally {
    // remove loader
  }
}
