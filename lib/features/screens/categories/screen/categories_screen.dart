import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/screen/widgets/lugares_screen.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard {
  final String name;
  final IconData icon; // Agrega el campo para el icono
  final Color? backgroundColor;

  CategoryCard({
    this.backgroundColor,
    required this.name,
    required this.icon,
  });
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text('Servizi', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LSizes.sm),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => LugaresScreen(categoria: category[index].name));
              },
              child: Card(
                elevation: 3.0,
                color: category[index]
                    .backgroundColor, // Color de fondo personalizado
                child: Padding(
                  padding: const EdgeInsets.all(LSizes.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category[index].icon,
                        size: 48.0,
                        color: Colors.white, // Color del icono
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.3), // Color y opacidad de la sombra
                            offset: const Offset(2.0,
                                2.0), // Desplazamiento en x e y de la sombra
                            blurRadius: 3.0, // Radio de desenfoque de la sombra
                          ),
                        ],
                      ),
                      const SizedBox(height: LSizes.spaceBtwItems),
                      Text(
                        category[index].name,
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
          },
        ),
      ),
    );
  }
}

// Lista de ejemplo de categorías con colores de fondo personalizados
List<CategoryCard> category = [
  CategoryCard(
    icon: Icons.restaurant,
    name: 'Servizio Ristoro',
    backgroundColor: const Color.fromARGB(255, 210, 132, 30), // Amarillo oscuro
  ),
  CategoryCard(
    icon: Icons.hotel,
    name: 'Allogio Notturno',
    backgroundColor: const Color.fromARGB(255, 162, 62, 142), // Morado oscuro
  ),
  CategoryCard(
    icon: Icons.shopping_bag,
    name: 'Servizio Indumenti',
    backgroundColor: const Color.fromARGB(255, 107, 198, 61), // Verde oscuro
  ),
  CategoryCard(
    icon: Icons.work,
    name: 'Orientamento Legale',
    backgroundColor: const Color.fromARGB(255, 43, 109, 162), // Azul oscuro
  ),
  CategoryCard(
    icon: Icons.work,
    name: 'Orientamento Lavorativo',
    backgroundColor: const Color.fromARGB(255, 8, 133, 168), // Azul oscuro
  ),
  CategoryCard(
    icon: Icons.healing,
    name: 'Servizio Sanitario',
    backgroundColor: const Color.fromARGB(255, 238, 76, 76), // Rojo oscuro
  ),
  CategoryCard(
    icon: Icons.hearing,
    name: 'Centro Ascolto',
    backgroundColor: const Color.fromARGB(255, 244, 123, 109), // Rosa oscuro
  ),
  CategoryCard(
    icon: Icons.directions_walk,
    name: 'Unita di Strada',
    backgroundColor: const Color(0xFFD6825B), // Naranja oscuro
  ),
  CategoryCard(
    icon: Icons.school,
    name: 'Corsi di Formazione',
    backgroundColor: const Color(0xFF407C74), // Verde oscuro
  ),
];
