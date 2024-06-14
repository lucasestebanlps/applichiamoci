import 'package:applichiamoci/common/widgets/buttons/text_button.dart';
import 'package:applichiamoci/common/widgets/loaders/loading_indicator.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/services/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/features/screens/services/screen/widgets/category_filter.dart';
import 'package:applichiamoci/features/screens/services/screen/widgets/place_card.dart';

class PlacesScreen extends StatefulWidget {
  final String service;
  final String nameService;

  const PlacesScreen({
    super.key,
    required this.service,
    required this.nameService,
  });

  @override
  PlacesScreenState createState() => PlacesScreenState();
}

class PlacesScreenState extends State<PlacesScreen> {
  final PlacesController placesController = Get.put(PlacesController());
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    placesController.fetchPlacesForService(widget.service);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(
          widget.nameService,
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LSizes.md),
        child: Obx(() {
          if (placesController.isLoading.value) {
            return const LoadingIndicator();
          } else if (placesController.placesForServices.isEmpty) {
            return LErrorCenteredText(
              icon: Icons.warning,
              text: tr(LocaleKeys.noLogoAvailable),
            );
          } else {
            return _buildPlacesList(placesController);
          }
        }),
      ),
      floatingActionButton: widget.service == 'unita_di_strada'
          ? LTextButton(
              onPressed: () {
                LHelperFunctions.urlAction(
                    'https://fondazione-emmanuel.org/unisciti-a-noi/');
              },
              text: '+ Iscriviti come volontario ',
            )
          : null,
    );
  }

  Widget _buildPlacesList(PlacesController placesController) {
    List<PlaceModel> places = placesController.placesForServices;
    List<String> categories = [
      'Tutti',
      'Minori',
      'Famiglia',
      'Adulti',
      'Migrazione',
      'Donne',
      'Disabilità',
      'Volonteriato'
    ];

    if (selectedCategory != null && selectedCategory != 'Todos') {
      places =
          places.where((place) => place.category == selectedCategory).toList();
    }

    return Column(
      children: [
        CategoryFilter(
          selectedCategory: selectedCategory,
          categories: categories,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
        ),
        const SizedBox(height: LSizes.spaceBtwItems),
        Expanded(
          child: places.isEmpty
              ? LErrorCenteredText(
                  icon: Icons.warning,
                  text: tr(LocaleKeys.noLogoAvailable),
                )
              : ListView.builder(
                  itemCount: places.length + 1, // +1 for the SizedBox
                  itemBuilder: (BuildContext context, int index) {
                    if (index == places.length) {
                      return const SizedBox(
                          height: LSizes.spaceBtwSections *
                              2); // Add space at the end
                    }
                    return PlaceCard(place: places[index]);
                  },
                ),
        ),
      ],
    );
  }
}
