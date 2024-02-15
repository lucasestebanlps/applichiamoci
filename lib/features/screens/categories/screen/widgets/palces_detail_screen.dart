import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceModel place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(place.title,
            style: Theme.of(context).textTheme.headlineSmall!),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (place.image != null && place.image!.isNotEmpty)
              Image.network(place.image!),
            const SizedBox(height: 16),
            Text(
              place.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              place.description.replaceAll(r'\n', '\n'),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ActionButtons(
                callActionParameter: place.phoneNumber,
                mapActionParameter: place.mapCoordinates),
          ],
        ),
      ),
    );
  }
}
