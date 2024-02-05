import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/category_shimmer.dart';
import 'package:applichiamoci/features/screens/categories/controllers/categories_controller.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/category_card.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text('Servizi', style: Theme.of(context).textTheme.headlineSmall!)
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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
