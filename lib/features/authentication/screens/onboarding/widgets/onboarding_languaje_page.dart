import 'package:applichiamoci/translations/locale_keys.g.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguajePage extends StatelessWidget {
  const LanguajePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(LSizes.md),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.loginTitle.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: LSizes.sm,
            ),
            Text(
              LocaleKeys.selectPreferredLanguage.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: LSizes.spaceBtwSections,
            ),
            ElevatedButton(
              onPressed: () {
                // Mostrar el diálogo de selección de idioma
                LHelperFunctions().showLanguageDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24), // Espaciado interno del botón
              ),
              child: Text(
                LocaleKeys.selectLanguage.tr(),
                style: const TextStyle(
                  fontSize: 16, // Tamaño de fuente del texto del botón
                  fontWeight: FontWeight.bold, // Negrita del texto del botón
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
