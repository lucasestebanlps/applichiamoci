import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed; // Cambia el tipo de onPressed a VoidCallback

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed, // Usa la función onPressed directamente aquí
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Cambia a un valor específico
            ),
          ),
          child: const Text(
            LTexts.viewMore,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
