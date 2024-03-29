import 'package:applichiamoci/common/widgets/buttons/view_more_button.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/palces_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/features/screens/categories/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PlacesScreen extends StatelessWidget {
  final String category;
  final String nameCategory;

  const PlacesScreen(
      {super.key, required this.category, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    final PlacesController placesController = Get.find<PlacesController>();

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
          if (placesController.isLoading.value) {
            return const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitSquareCircle(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                  SizedBox(height: LSizes.spaceBtwItems),
                  Text('Loading...')
                ],
              ),
            );
          } else if (placesController.placesForCategory.isEmpty) {
            return const LErrorCenteredText(
              icon: Icons.warning,
              text: 'Nessun luogo disponibile per questa categoria.',
            );
          } else {
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
                            placeholder: (context, url) => const LShimerEffect(
                                width: double.infinity, height: 200),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        const SizedBox(height: LSizes.spaceBtwItems),
                        Text(places[index].title,
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(
                          places[index].description.replaceAll(r'\n', '\n'),
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: LSizes.spaceBtwItems),
                        ViewMoreButton(
                          onPressed: () {
                            Get.to(
                                () => PlaceDetailScreen(place: places[index]));
                          },
                        ),
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
