import 'package:applichiamoci/features/screens/categories/screen/categories_screen.dart';
import 'package:applichiamoci/features/screens/home/screen/news_screen.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/emergency_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = LHelperFunctions.isDarkMode(context);

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70.0, // ajusta el ancho según tus necesidades
        height: 70.0, // ajusta la altura según tus necesidades
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Iconsax.call,
            color: LColors.white,
            size: 35,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const EmergencyCallBottomSheet();
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 62,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.transparent,
          indicatorColor: darkMode
              ? LColors.white.withOpacity(0.1)
              : LColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
                icon: const Icon(Iconsax.home), label: tr(LTexts.home)),
            const SizedBox(width: 40),
            NavigationDestination(
                icon: const Icon(Iconsax.category), label: tr(LTexts.servizi)),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const NewsScreen(), Container(), const CategoriesScreen()];
}
