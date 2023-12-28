import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update current index & animate to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // check if is the first time to show onboarding screen or not
      final storage = GetStorage();

      if (kDebugMode) {
        print('=========== GET STORAGE Next button ============');
        print(storage.read('ISFirstTime'));
    }


      storage.write('IsFirstTime', false);

      Get.offAll(const LoginScreen());
    } else {
      int nextPage = currentPageIndex.value + 1;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(
            milliseconds: 300), // Ajusta la duración según sea necesario
        curve: Curves.easeInOut, // Puedes ajustar la curva de la animación
      );
    }
  }

  // Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
