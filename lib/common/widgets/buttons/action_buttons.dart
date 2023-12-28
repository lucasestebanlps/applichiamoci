import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            // Lógica para "llamar"
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            side: const BorderSide(color: Colors.green),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 8), // Añade padding
          ),
          child: const Text('Chiama'),
        ),
        const SizedBox(width: LSizes.spaceBtwItems),
        ElevatedButton(
          onPressed: () {
            // Lógica para "ver mapa"
          },
          style: ElevatedButton.styleFrom(
            // Cambia el color del texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 8), // Añade padding
          ),
          child: const Text('Mappa'),
        ),
      ],
    );
  }
}
