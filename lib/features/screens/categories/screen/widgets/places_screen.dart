import 'package:applichiamoci/common/widgets/buttons/view_more_button.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/palces_detail_screen.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
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
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpinKitSquareCircle(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                  const SizedBox(height: LSizes.spaceBtwItems),
                  Text(tr(LTexts.loadingText))
                ],
              ),
            );
          } else if (placesController.placesForCategory.isEmpty) {
            return LErrorCenteredText(
              icon: Icons.warning,
              text: tr(LTexts.noLogoAvailable),
            );
          } else {
            List<PlaceModel> places = placesController.placesForCategory;
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: LSizes.spaceBtwItems),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(LSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(places[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: LSizes.sm,
                        ),
                        Text(
                          places[index].description.replaceAll(r'\n', '\n'),
                          maxLines: 2, // Limita el texto a dos líneas
                          overflow: TextOverflow
                              .ellipsis, // Agrega puntos suspensivos si el texto se desborda
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
