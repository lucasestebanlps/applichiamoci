import 'package:flutter/material.dart';
import 'package:applichiamoci/features/screens/home/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel home;

  const NewsDetailScreen({super.key, required this.home});

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
        padding: const EdgeInsets.all(LSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------ IMAGEN ------

            ClipRRect(
              borderRadius: BorderRadius.circular(LSizes.cardRadiusSm),
              child: CachedNetworkImage(
                imageUrl: home.image ?? '',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LShimerEffect(
                  width: double.infinity,
                  height: 250,
                ),
                errorWidget: (context, url, error) => const Icon(Icons
                    .error), // Widget de error si no se puede cargar la imagen
              ),
            ),
            const SizedBox(height: LSizes.spaceBtwItems),

            // ------ TITLE ------
            Text(home.title.replaceAll(r'\n', '\n'),
                style: Theme.of(context).textTheme.headlineMedium),

            // ------ SUBTITLE ------
            Text(home.subtitle.replaceAll(r'\n', '\n'),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: LSizes.spaceBtwItems),

            // ------ PARAGRAPH ------

            Text(home.paragraph.replaceAll(r'\n', '\n'),
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: LSizes.spaceBtwSections),

            // ------ BUTTONS ------

            ActionButtons(
              callActionParameter: home.phoneNumber,
              mapActionParameter: home.mapCoordinates,
            ),
          ],
        ),
      ),
    );
  }
}
