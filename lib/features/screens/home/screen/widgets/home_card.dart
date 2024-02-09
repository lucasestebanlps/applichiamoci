import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:applichiamoci/features/screens/home/screen/widgets/home_detail_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applichiamoci/features/screens/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCard extends StatelessWidget {
  final HomeModel home;

  const HomeCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(LSizes.sm),
      child: Card(
        elevation: 5, // Aumentar la elevación para agregar sombras más notables
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Bordes redondeados para la card
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
                ClipRRect( // Bordes redondeados para la imagen
                  borderRadius: BorderRadius.circular(15.0),
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
                const SizedBox(height: LSizes.sm),
                Text(
                  home.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  home.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: LSizes.sm),
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        LTexts.viewMore,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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

  void _navigateToDetailScreen(HomeModel home) {
    Get.to(() => HomeDetailScreen(home: home));
  }
}
