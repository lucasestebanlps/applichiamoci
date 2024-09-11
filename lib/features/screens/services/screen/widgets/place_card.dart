import 'package:applichiamoci/features/screens/services/screen/palces_detail_screen.dart';
import 'package:applichiamoci/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/common/widgets/buttons/text_button.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: LSizes.spaceBtwItems),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(LSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- TITLE -----
            Text(
              place.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: LSizes.sm),

            // ---- DESCRIPTION -----
            Text(
              place.description.replaceAll(r'\n', '\n'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: LSizes.spaceBtwItems),

            // ---- CATEGORY AND BUTTON -----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (place.category != null && place.category!.isNotEmpty)
                  Row(
                    children: [
                      const Icon(Icons.people),
                      const SizedBox(width: LSizes.spaceBtwItems),
                      Text(
                        place.category!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                if (place.category == null || place.category!.isEmpty)
                  const SizedBox(), // Add an empty SizedBox to take up space
                LTextButton(
                  text: tr(LocaleKeys.viewMore),
                  onPressed: () {
                    Get.to(() => PlaceDetailScreen(place: place));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
