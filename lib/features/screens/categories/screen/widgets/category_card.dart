import 'package:applichiamoci/features/screens/categories/models/category_model.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/places_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LCategoryCard extends StatelessWidget {
  const LCategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PlacesScreen(category: category.id, nameCategory: category.name,));
      },
      child: Card(
        elevation: 3.0,
        color: Color(category.backgroundColor), // Color de fondo personalizado
        child: Padding(
          padding: const EdgeInsets.all(LSizes.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.fromString(category.icon), // use estos iconos para poder almacenarlos como string en firebase
                size: 48.0,
                color: Colors.white, // Color del icono
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.3), // Color y opacidad de la sombra
                    offset: const Offset(2.0,
                        2.0), // Desplazamiento en x e y de la sombra
                    blurRadius:
                        3.0, // Radio de desenfoque de la sombra
                  ),
                ],
              ),
              const SizedBox(height: LSizes.spaceBtwItems),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors
                      .white, // Forzar el color del texto a blanco
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.3), // Color y opacidad de la sombra
                      offset: const Offset(2.0,
                          2.0), // Desplazamiento en x e y de la sombra
                      blurRadius:
                          3.0, // Radio de desenfoque de la sombra
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
