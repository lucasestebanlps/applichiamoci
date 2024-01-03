import 'package:applichiamoci/features/home/widgets/home_detail_screen.dart';
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
                height: 5,
              ),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              Text(description, textAlign: TextAlign.start),
              const SizedBox(
                height: 5,
              ),
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
                            BorderRadius.circular(10.0), // Bordes redondeados
                      ),
                    ),
                    child: const Text('View more'),
                  ),
                  const SizedBox(width: 8),
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
