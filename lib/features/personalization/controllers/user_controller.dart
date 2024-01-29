import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/data/repositories/user/user_repository.dart';
import 'package:applichiamoci/features/authentication/models/user_model.dart';
import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/features/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/network_manager.dart';
import 'package:applichiamoci/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any Regsitration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update rx user and then check if user data is already stored. If not store new data
      await fetchUserRecord();
      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      LLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(LSizes.md),
        title: LTexts.deleteAccount,
        middleText: LTexts.sureToDelete,
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: LSizes.lg),
              child: Text(LTexts.delete),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text(LTexts.cancel)));
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      LFullScreenLoader.openLoadingDialog(
          'Processing', LImages.checkInformation);

      // Firstr re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          LFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          LFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      LFullScreenLoader.openLoadingDialog(
          'Processing', LImages.checkInformation);

      // Check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        LFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      LFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;

        user.refresh();
        LLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile image has been updated');
      }
    } catch (e) {
      LLoaders.errorSnackBar(
          title: 'Error', message: 'Something went wrong $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
