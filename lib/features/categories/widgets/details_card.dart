import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String description;

  const DetailsCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image(
                  image: image,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(title,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: 5,
              ),
              Text(description, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 8,
              ),
              const ActionButtons()
            ],
          ),
        ),
      ),
    );
  }
}