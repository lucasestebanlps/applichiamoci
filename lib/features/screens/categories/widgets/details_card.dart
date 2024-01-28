import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String description;
  final String phoneNumber;
  final String mapUrl;

  const DetailsCard({
    super.key,
    required this.image,
    required this.title,
    required this.description, 
    required this.phoneNumber, 
    required this.mapUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(LSizes.sm),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------- IMAGE --------
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(LSizes.borderRadiusSm),
                  topRight: Radius.circular(LSizes.borderRadiusSm),
                ),
                child: Image(
                  image: image,
                ),
              ),
              // -------- TITLE --------
              const SizedBox(
                height: LSizes.spaceBtwItems,
              ),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: LSizes.sm,
              ),
              // -------- DESCRIPTION --------
              Text(description,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: LSizes.spaceBtwItems,
              ),
              // -------- BUTTONS --------
              ActionButtons(callActionParameter: phoneNumber, mapActionParameter: mapUrl,)
            ],
          ),
        ),
      ),
    );
  }
}
