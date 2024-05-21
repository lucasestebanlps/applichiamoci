import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    this.callActionParameter,
    this.mapActionParameter,
  });

  final String? callActionParameter;
  final String? mapActionParameter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (callActionParameter != null && callActionParameter!.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: Colors.green, // Color de fondo
              borderRadius: BorderRadius.circular(100), // Borde redondeado
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Color de la sombra
                  spreadRadius: 1, // Radio de propagación de la sombra
                  blurRadius: 4, // Radio de desenfoque de la sombra
                  offset: const Offset(0, 4), // Desplazamiento de la sombra
                ),
              ],
            ),
            child: IconButton(
              onPressed: () =>
                  LHelperFunctions.callAction(callActionParameter!),
              icon: const Icon(Icons.call),
              iconSize: 40, // Tamaño del icono
              color: Colors.white, // Color del icono
              padding: const EdgeInsets.all(10),
            ),
          ),
        if (mapActionParameter != null && mapActionParameter!.isNotEmpty) ...[
          const SizedBox(width: LSizes.spaceBtwItems),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Color de fondo
              borderRadius: BorderRadius.circular(100), // Borde redondeado
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Color de la sombra
                  spreadRadius: 1, // Radio de propagación de la sombra
                  blurRadius: 4, // Radio de desenfoque de la sombra
                  offset: const Offset(0, 4), // Desplazamiento de la sombra
                ),
              ],
            ),
            child: IconButton(
              onPressed: () => LHelperFunctions.mapAction(mapActionParameter),
              icon: const Icon(Icons.location_on),
              iconSize: 40, // Tamaño del icono
              color: Colors.white, // Color del icono
              padding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ],
    );
  }
}
