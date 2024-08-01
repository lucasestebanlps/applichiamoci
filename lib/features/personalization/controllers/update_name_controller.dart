import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/user/user_repository.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/features/screens/profile/profile_screen.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/network_manager.dart';
import 'package:applichiamoci/utils/popups/full_screen_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName(GlobalKey<FormState> formKey) async {
    try {
      LFullScreenLoader.openLoadingDialog(
          tr(LocaleKeys.updatingInformation), LImages.checkInformation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        LFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      LLoaders.successSnackBar(
          title: tr(LocaleKeys.congratulations),
          message: tr(LocaleKeys.nameUpdated));

      Get.off(() => const ProfileScreen());
    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    }
  }
}
