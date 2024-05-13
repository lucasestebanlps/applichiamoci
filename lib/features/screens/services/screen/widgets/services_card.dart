import 'package:applichiamoci/features/screens/services/models/service_model.dart';
import 'package:applichiamoci/features/screens/services/screen/widgets/places_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LServicesCard extends StatelessWidget {
  const LServicesCard({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PlacesScreen(
              service: service.id,
              nameService: service.name,
            ));
      },
      child: Card(
        elevation: 3.0,
        color: Color(int.parse(
            '0xFF${service.backgroundColor}')), // Color de fondo personalizado
        child: Padding(
          padding: const EdgeInsets.all(LSizes.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.fromString(service
                    .icon), // use estos iconos para poder almacenarlos como string en firebase
                size: 48.0,
                color: Colors.white, // Color del icono
                shadows: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.3), // Color y opacidad de la sombra
                    offset: const Offset(
                        2.0, 2.0), // Desplazamiento en x e y de la sombra
                    blurRadius: 3.0, // Radio de desenfoque de la sombra
                  ),
                ],
              ),
              const SizedBox(height: LSizes.spaceBtwItems),
              Text(
                service.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white, // Forzar el color del texto a blanco
                  shadows: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3), // Color y opacidad de la sombra
                      offset: const Offset(
                          2.0, 2.0), // Desplazamiento en x e y de la sombra
                      blurRadius: 3.0, // Radio de desenfoque de la sombra
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
