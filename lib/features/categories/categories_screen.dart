import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/categories/widgets/category_card.dart';
import 'package:flutter/material.dart';

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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos elementos por línea
          crossAxisSpacing:  4, // Espaciado horizontal entre elementos
        ),
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: CategoryCard(
                icon: categorias[index].icon,
                name: categorias[index].name,
                page: categorias[index].page,
            ),
          );
        },
      ),
    );
  }
}