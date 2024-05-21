import 'package:applichiamoci/common/widgets/loaders/animation_loader.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// a utility class for managing a full-screen loading dialog.
class LFullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation.
  // This method doesn't return anything.

  // parameters:
  // - text: the text to be displayed in the loading dialog
  // - animation: the lottie animatio to be shown.

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // use Get.overlayContext for overlay dialogs
        barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
              canPop: false, // disable popping with the back button
              child: Container(
                color: LHelperFunctions.isDarkMode(Get.context!)
                    ? LColors.dark
                    : LColors.light,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 250),
                      LAnimationLoaderWidget(text: text, animation: animation)
                    ],
                  ),
                ),
              ),
            )
          );
  }

  // Stop the currently open loading dialog
  // this method doesnt return anything

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //close the dialog using the navigator
  }
}
