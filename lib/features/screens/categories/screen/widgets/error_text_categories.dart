import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ErrorTextCategories extends StatelessWidget {
  const ErrorTextCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 50,
            color: Colors.orange,
          ),
          Text(
            '¡Ops!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: LSizes.spaceBtwItems),
          Text(
            'Nessun luogo disponibile per questa categoria.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
