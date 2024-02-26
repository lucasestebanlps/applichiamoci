import 'package:applichiamoci/common/widgets/buttons/view_more_button.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/features/screens/home/screen/widgets/news_detail_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applichiamoci/features/screens/home/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  final NewsModel home;

  const NewsCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(LSizes.sm),
      child: Card(
        elevation: 5, // Aumentar la elevación para agregar sombras más notables
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              LSizes.cardRadiusSm), // Bordes redondeados para la card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------ IMAGEN ------
            ClipRRect(
              // Bordes redondeados para la imagen
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(LSizes.cardRadiusSm)),
              child: CachedNetworkImage(
                imageUrl: home.image ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LShimerEffect(
                  width: double.infinity,
                  height: 200,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: LSizes.spaceBtwItems),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: LSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------ TITLE ------
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    home.title.replaceAll(r'\n', '\n'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(
                    height: LSizes.sm,
                  ),

                  // ------ DESCRIPTION ------
                  Text(home.description.replaceAll(r'\n', '\n'),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: LSizes.spaceBtwItems),

                  // ------ BUTTON VIEW MORE ------
                  ViewMoreButton(
                    onPressed: () {
                      Get.to(() => NewsDetailScreen(
                            home: home,
                          ));
                    },
                  ),
                  const SizedBox(height: LSizes.sm),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
