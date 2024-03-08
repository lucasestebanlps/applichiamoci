import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LCategoryShimmer extends StatelessWidget {
  const LCategoryShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount:
          itemCount, // Para mostrar la cantidad de elementos que queremos
      itemBuilder: (_, index) {
        return LShimerEffect(
          key:
              UniqueKey(), // Asegurarse de proporcionar claves únicas para cada shimmer
          width: double.infinity,
          height: 200.0, // Ajusta la altura
          radius: 10.0,
        );
      },
    );
  }
}
