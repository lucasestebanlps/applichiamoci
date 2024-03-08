import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/category_shimmer.dart';
import 'package:applichiamoci/features/screens/categories/controllers/categories_controller.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/category_card.dart';
import 'package:applichiamoci/features/screens/categories/controllers/places_controller.dart'; // Agrega la importación de PlacesController
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController =
        Get.put<CategoryController>(CategoryController());
    final placesController = Get.put<PlacesController>(
        PlacesController()); // Crea la instancia de PlacesController aquí

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text(tr(LocaleKeys.servizi),
              style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LSizes.sm),
        child: Obx(() {
          // Si todavia no cargaron las categorias muestra el shimmer personalizado
          if (categoryController.isLoading.value) {
            return const LCategoryShimmer(itemCount: 8);
          }
          // Cuando las categorias estan cargadas genera la grid de categorias
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: categoryController.allCategories.length,
            itemBuilder: (_, index) {
              final category = categoryController.allCategories[index];
              return LCategoryCard(category: category);
            },
          );
        }),
      ),
    );
  }
}
