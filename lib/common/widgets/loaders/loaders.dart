import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';

class LLoaders {
  static void warningSnackBar({
    required String title,
    String message = '',
    TextButton? mainButton, // Parámetro opcional para el botón principal
  }) {
    Get.snackbar(
      '',
      '', // Dejamos el mensaje vacío ya que lo colocaremos en la columna personalizada.
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      margin: const EdgeInsets.all(LSizes.md),
      backgroundColor: Colors.orange,
      padding: const EdgeInsets.symmetric(horizontal: LSizes.md, vertical: 0),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Columna para el icono
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Iconsax.warning_2, color: Colors.white),
                ],
              ),
              // Espacio entre el icono y el título
              const SizedBox(width: LSizes.spaceBtwItems),
              // Columna para el título y el mensaje
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Fila para el botón principal
          if (mainButton == null)
            const SizedBox(
              height: LSizes.lg,
            ),
          if (mainButton != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Espacio para alinear el botón a la izquierda
                mainButton,
              ],
            ),
          const SizedBox(
            height: LSizes.sm,
          )
        ],
      ),
    );
  }

  static void errorSnackBar({
    required String title,
    String message = '',
    mainButton = false, // Parámetro opcional para el botón principal
  }) {
    Get.snackbar(
      '',
      '', // Dejamos el mensaje vacío ya que lo colocaremos en la columna personalizada.
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      margin: const EdgeInsets.all(LSizes.md),
      padding: const EdgeInsets.symmetric(horizontal: LSizes.sm, vertical: 0),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Columna para el icono
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Iconsax.warning_2, color: Colors.white),
                ],
              ),
              // Espacio entre el icono y el título
              const SizedBox(width: LSizes.spaceBtwItems),
              // Columna para el título y el mensaje
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Fila para el botón principal
          if (mainButton == false)
            const SizedBox(
              height: LSizes.lg,
            ),

          if (mainButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Espacio para alinear el botón a la izquierda
                TextButton(
                  onPressed: () async {
                    await openAppSettings();
                  },
                  child: const Text(LTexts.openSettingsText,
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          const SizedBox(
            height: LSizes.sm,
          )
        ],
      ),
    );
  }

  static void successSnackBar({
    required String title,
    String message = '',
    TextButton? mainButton, // Parámetro opcional para el botón principal
  }) {
    Get.snackbar(
      '',
      '', // Dejamos el mensaje vacío ya que lo colocaremos en la columna personalizada.
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade600,
      margin: const EdgeInsets.all(LSizes.md),

      padding: const EdgeInsets.symmetric(horizontal: LSizes.md, vertical: 0),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Columna para el icono
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Iconsax.check, color: Colors.white),
                ],
              ),
              // Espacio entre el icono y el título
              const SizedBox(width: LSizes.spaceBtwItems),
              // Columna para el título y el mensaje
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Fila para el botón principal
          if (mainButton == null)
            const SizedBox(
              height: LSizes.lg,
            ),
          if (mainButton != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Espacio para alinear el botón a la izquierda
                mainButton,
              ],
            ),
          const SizedBox(
            height: LSizes.sm,
          )
        ],
      ),
    );
  }
}
