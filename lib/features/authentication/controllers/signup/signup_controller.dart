// import 'package:applichiamoci_second/common/widgets/loaders/loaders.dart';
// import 'package:applichiamoci_second/data/repositories/authentication/authentication_repository.dart';
// import 'package:applichiamoci_second/data/repositories/user/user_repository.dart';
// import 'package:applichiamoci_second/features/authentication/screens/signup/verify_email.dart';
// import 'package:applichiamoci_second/features/personalization/models/user_model.dart';
// import 'package:applichiamoci_second/utils/constants/image_strings.dart';
// import 'package:applichiamoci_second/utils/helpers/network_manager.dart';
// import 'package:applichiamoci_second/utils/popups/full_screen_loader.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupController extends GetxController {
//   static SignupController get instance => Get.find();

//   // Variables
//   final privacyPolicy = true.obs;
//   final hidePassword = true.obs; // observable for hiding/showing password
//   final email = TextEditingController(); // Controller form email input
//   final lastName = TextEditingController(); // Controller form lastName input
//   final username = TextEditingController(); // Controller form username input
//   final password = TextEditingController(); // Controller form password input
//   final firstName = TextEditingController(); // Controller form firstName input
//   final phoneNumber =
//       TextEditingController(); // Controller form phoneNumber input
//   GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();

//   // SIGNUP
//   void signup() async {
//     try {
//       // start loading
//       TFullScreenLoader.openLoadingDialog(
//           'We are processing your information...', TImages.onBoardingImage1);

//       // check internet conectivity

//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) return;

//       // form validation
//       if (signupFromKey.currentState!.validate()) return;

//       // privacy policy check
//       if (!privacyPolicy.value) {
//         TLoaders.warningSnackBar(
//           title: 'Accept Privacy Policy',
//           message:
//               'In order to create account, you moust have to read and accept the Privacy Policy & Terms of use.',
//         );
//         return;
//       }

//       // Register user in the Firebase Authentication & Save user data in the firebase
//       final userCredential = await AuthenticationRepository.instance
//           .registerWithEmailAndPassword(
//               email.text.trim(), password.text.trim());

//       // Save Authenticated user data in the firebase firestore
//       final newUser = UserModel(
//         id: userCredential.user!.uid,
//         firstName: firstName.text.trim(),
//         lastName: lastName.text.trim(),
//         username: username.text.trim(),
//         email: email.text.trim(),
//         phoneNumber: phoneNumber.text.trim(),
//         profilePicture: '',
//       );

//       final userRepository = Get.put(UserRepository());
//       await userRepository.saveUserRecord(newUser);

//       // show success message
//       TLoaders.successSnackBar(
//           title: 'Congratulations',
//           message: 'Your account has been created! Verify email to continue.');

//       // Move to verify email screen
//       Get.to(() => const VerifyEmailScreen());
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       // Show some generic error to the user
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
// }
