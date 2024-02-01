import 'package:applichiamoci/features/screens/home/widgets/home_detail_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String subtitle;
  final String description;
  final String paragraph;
  final String? phoneNumber;
  final String? mapUrl;

  const HomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.subtitle,
    required this.paragraph, 
    this.phoneNumber, 
    this.mapUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LSizes.sm),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(LSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------- Image -------
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(LSizes.cardRadiusMd),
                  topRight: Radius.circular(LSizes.cardRadiusMd),
                ),
                child: Image(
                  image: image,
                ),
              ),
              const SizedBox(
                height: LSizes.sm,
              ),
              // ------- Title -------
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20)),
              // ------- SubTitle -------
              Text(description, textAlign: TextAlign.start),
              const SizedBox(
                height: LSizes.sm,
              ),
              // ------- Button -------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Lógica del botón
                      _navigateToDetailScreen();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // Color del texto
                      backgroundColor: Colors.blue, // Color de fondo
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(LSizes.cardRadiusMd), // Bordes redondeados
                      ),
                    ),
                    child: const Text('View more'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailScreen() {
    Get.to(() => HomeDetailScreen(
          image: image,
          title: title,
          subtitle: subtitle,
          paragraph: paragraph,
          phoneNumber: phoneNumber,
          mapUrl: mapUrl,
        ));
  }
}
