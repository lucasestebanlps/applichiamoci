import 'package:applichiamoci/common/widgets/buttons/view_more_button.dart';
import 'package:applichiamoci/features/screens/services/screen/widgets/palces_detail_screen.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/services/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PlacesScreen extends StatefulWidget {
  final String service;
  final String nameService;

  const PlacesScreen(
      {super.key, required this.service, required this.nameService});

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final PlacesController placesController = Get.find<PlacesController>();
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    if (placesController.placesForServices.isEmpty ||
        placesController.currentService != widget.service) {
      placesController.fetchPlacesForService(widget.service);
    }

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(widget.nameService,
            style: Theme.of(context).textTheme.headlineSmall!),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LSizes.sm),
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
                  Text(tr(LocaleKeys.loadingText))
                ],
              ),
            );
          } else if (placesController.placesForServices.isEmpty) {
            return LErrorCenteredText(
              icon: Icons.warning,
              text: tr(LocaleKeys.noLogoAvailable),
            );
          } else {
            List<PlaceModel> places = placesController.placesForServices;
            List<String> categories = [
              'Todos',
              'Minori',
              'Famiglia',
              'Adulti',
              'Migrazione'
            ];

            // Aplicar filtrado si se selecciona una categoría
            if (selectedCategory != null && selectedCategory != 'Todos') {
              places = places
                  .where((place) => place.category == selectedCategory)
                  .toList();
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: selectedCategory,
                      hint: const Text('Filtrar por categoría'),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: LSizes.spaceBtwItems,
                ),
                Expanded(
                  child: places.isEmpty
                      ? LErrorCenteredText(
                          icon: Icons.warning,
                          text: tr(LocaleKeys.noLogoAvailable),
                        )
                      : ListView.builder(
                          itemCount: places.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              margin: const EdgeInsets.only(
                                  bottom: LSizes.spaceBtwItems),
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.all(LSizes.md),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(places[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    const SizedBox(
                                      height: LSizes.sm,
                                    ),
                                    Text(
                                      places[index]
                                          .description
                                          .replaceAll(r'\n', '\n'),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                        height: LSizes.spaceBtwItems),
                                    if (places[index].category != null &&
                                        places[index].category!.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.people),
                                              const SizedBox(
                                                  width: LSizes.spaceBtwItems),
                                              Text(
                                                places[index].category!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ],
                                          ),
                                          ViewMoreButton(
                                            onPressed: () {
                                              Get.to(() => PlaceDetailScreen(
                                                  place: places[index]));
                                            },
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
