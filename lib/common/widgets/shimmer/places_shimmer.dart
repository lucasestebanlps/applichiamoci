import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';

class LPlacesShimmer extends StatelessWidget {
  const LPlacesShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: LSizes.spaceBtwItems),
          child: LShimerEffect(
                      key:
                UniqueKey(), // Asegurarse de proporcionar claves únicas para cada shimmer
            width: double.infinity,
            height: 150.0, // Ajusta la altura 
          ),
        );
      },
    );
  }
}