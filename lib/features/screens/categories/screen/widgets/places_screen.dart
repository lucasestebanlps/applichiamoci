import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/places_shimmer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/features/screens/categories/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/error_text_categories.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlacesScreen extends StatelessWidget {
  final String category;
  final String nameCategory;

  const PlacesScreen(
      {super.key, required this.category, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    final PlacesController placesController = Get.find<PlacesController>();

    // Cargar los lugares solo si no se han cargado previamente o si la categoría ha cambiado
    if (placesController.placesForCategory.isEmpty ||
        placesController.currentCategory != category) {
      placesController.fetchPlacesForCategory(category);
    }

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(nameCategory,
            style: Theme.of(context).textTheme.headlineSmall!),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.sm),
        child: Obx(() {
          // Muestra el loader mientras se cargan los lugares
          if (placesController.isLoading.value) {
            return const LPlacesShimmer(itemCount: 4);
          } else if (placesController.placesForCategory.isEmpty) {
            return const ErrorTextCategories();
          } else {
            // Lista de lugares para la categoría seleccionada
            List<PlaceModel> places = placesController.placesForCategory;
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.all(LSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (places[index].image != null &&
                            places[index].image!.isNotEmpty)
                          CachedNetworkImage(
                            imageUrl: places[index].image ?? '',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const LShimerEffect(width: double.infinity, height: 200), // Placeholder mientras se carga la imagen
                            errorWidget: (context, url, error) => const Icon(Icons.error), // Widget de error si no se puede cargar la imagen
                          ),
                        const SizedBox(height: LSizes.spaceBtwItems),
                        Text(places[index].title,
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(places[index].description,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: LSizes.spaceBtwItems),
                        ActionButtons(
                            callActionParameter: places[index].phoneNumber,
                            mapActionParameter: places[index].direction),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

