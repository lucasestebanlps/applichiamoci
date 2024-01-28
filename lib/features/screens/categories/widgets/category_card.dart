import 'package:applichiamoci/features/screens/categories/widgets/details_screens/allogio_notturno.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/centro_ascolto.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/corsi_di_formazione.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/orientamento_lavorativo.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/orientamento_legale.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/servizio_indumenti.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/servizio_ristoro.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/servizio_sanitario.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_screens/unita_di_strada.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback page;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: page,
    
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48.0),
              const SizedBox(height: LSizes.spaceBtwItems),
              Text(
                name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
    );
  }
}

// Lista de ejemplo de categorías
List<CategoryCard> categorias = [
  CategoryCard(
      icon: Icons.category,
      name: 'Servizio Ristoro',
      page: () => Get.to(() => const ServizioRistoro())),
  CategoryCard(
      icon: Icons.category,
      name: 'Allogio Notturno',
      page: () => Get.to(() => const AllogioNotturno())),
  CategoryCard(
      icon: Icons.category,
      name: 'Servizio Indumenti',
      page: () => Get.to(() => const ServizioIndumenti())),
  CategoryCard(
      icon: Icons.category,
      name: 'Orientamento Legale',
      page: () => Get.to(() => const OrientamentoLegale())),
  CategoryCard(
      icon: Icons.category,
      name: 'Orientamiento Lavorativo',
      page: () => Get.to(() => const OrientamentoLavorativo())),
  CategoryCard(
      icon: Icons.category,
      name: 'Servizio Sanitario',
      page: () => Get.to(() => const ServizioSanitario())),
  CategoryCard(
      icon: Icons.category,
      name: 'Centro Ascolto',
      page: () => Get.to(() => const CentroAscolto())),
  CategoryCard(
      icon: Icons.category,
      name: 'Unita di Strada',
      page: () => Get.to(() => const UnitaDiStrada())),
  CategoryCard(
      icon: Icons.category,
      name: 'Corsi di Formazione',
      page: () => Get.to(() => const CorsiDiFormazione())),
];
