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
          ),
          child: Text(LTexts.viewMore,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
