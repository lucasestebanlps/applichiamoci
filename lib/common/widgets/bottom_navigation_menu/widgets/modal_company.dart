import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ModalCompany extends StatelessWidget {
  const ModalCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Iconsax.info_circle,
        color: Colors.blue,
      ),
      iconSize: 24,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Nostro numero'),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(LSizes.cardRadiusSm), // Cambia el radio de borde según lo necesites
              ),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Esta es una breve explicación sobre la el numero de la empresa y como puede ayudar a los clientes.',
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Agrega aquí la lógica para ir al sitio web de la empresa
                  },
                  child: const Text('Ir al sitio'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}