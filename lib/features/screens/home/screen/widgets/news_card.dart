import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/features/screens/home/screen/widgets/news_detail_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
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
        child: InkWell(
          onTap: () {
            _navigateToDetailScreen(home);
          },
          child: Padding(
            padding: const EdgeInsets.all(LSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------ IMAGEN ------
                ClipRRect(
                  // Bordes redondeados para la imagen
                  borderRadius: BorderRadius.circular(LSizes.cardRadiusSm),
                  child: CachedNetworkImage(
                    imageUrl: home.image ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LShimerEffect(
                      width: double.infinity,
                      height: 200,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: LSizes.spaceBtwItems),

                // ------ TITLE ------
                Text(
                  home.title.replaceAll(r'\n', '\n'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                // ------ DESCRIPTION ------
                Text(home.description.replaceAll(r'\n', '\n'),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: LSizes.sm),

                // ------ BUTTON VIEW MORE ------
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _navigateToDetailScreen(home);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(LSizes.cardRadiusSm),
                        ),
                      ),
                      child: const Text(
                        LTexts.viewMore,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDetailScreen(NewsModel home) {
    Get.to(() => NewsDetailScreen(home: home));
  }
}
