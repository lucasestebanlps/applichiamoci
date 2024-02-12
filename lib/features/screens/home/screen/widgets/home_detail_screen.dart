import 'package:flutter/material.dart';
import 'package:applichiamoci/features/screens/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';

class HomeDetailScreen extends StatelessWidget {
  final HomeModel home;

  const HomeDetailScreen({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(
          home.title,
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: home.image ?? '',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LShimerEffect(
                width: double.infinity,
                height: 250,
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Widget de error si no se puede cargar la imagen
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
            Text(
              home.subtitle,
              style: Theme.of(context).textTheme.titleMedium
                    ),
            const SizedBox(height: LSizes.spaceBtwItems / 2),
            Text(
              home.paragraph,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(height: LSizes.spaceBtwSections),
            ActionButtons(
              callActionParameter: home.phoneNumber,
              mapActionParameter: home.mapUrl,
            ),
          ],
        ),
      ),
    );
  }
}
