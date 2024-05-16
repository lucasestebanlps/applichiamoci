import 'package:flutter/material.dart';

class LTextButton extends StatelessWidget {
  const LTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed; // Cambia el tipo de onPressed a VoidCallback
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed, // Usa la función onPressed directamente aquí
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
