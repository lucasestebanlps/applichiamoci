import 'package:applichiamoci/features/screens/categories/categories_screen.dart';
import 'package:applichiamoci/features/screens/home/home_screen.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/emergency_modal.dart';
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
             showDialog(
              context: context,
              builder: (context) => const EmergencyCallModal(),
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
          backgroundColor: darkMode ? LColors.black : LColors.light,
          indicatorColor: darkMode
              ? LColors.white.withOpacity(0.1)
              : LColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            SizedBox(width: 40),
            NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Servizi'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(),
    const CategoriesScreen()
  ];
}

