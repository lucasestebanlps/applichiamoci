import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LErrorCenteredText extends StatelessWidget {
  final IconData icon;
  final String text;
  const LErrorCenteredText({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.orange,
          ),
          const Text(
            '¡Ops!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: LSizes.spaceBtwItems),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
