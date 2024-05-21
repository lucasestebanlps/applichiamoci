import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EmergencyServiceButton extends StatelessWidget {
  final String label;
  final String phoneNumber;
  final IconData? iconData;
  final AssetImage? assetImage; // Nuevo parámetro para la imagen
  final Color? highlightColor;

  const EmergencyServiceButton({
    super.key,
    required this.label,
    required this.phoneNumber,
    this.iconData,
    this.assetImage, // Inicialización del nuevo parámetro
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        LHelperFunctions.callAction(phoneNumber);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: highlightColor ?? const Color(0xFF425F82),
        side: BorderSide(color: highlightColor ?? const Color(0xFF425F82)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Comprueba si hay una imagen y la muestra, si no, muestra el icono
                  if (assetImage != null)
                    Image(
                      image: assetImage!,
                      width: 34.0,
                      height: 34.0,
                    )
                  else if (iconData != null)
                    Icon(
                      iconData,
                      color: Colors.white,
                    ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.phone,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
