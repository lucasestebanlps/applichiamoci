import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LLoginHeader extends StatelessWidget {
  const LLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context)
          .size
          .width, // Ancho igual al ancho de la pantalla
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Alineación a la izquierda
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: LSizes.md),
          Image(
            height: 150,
            image:
                AssetImage(dark ? LImages.lightApplogo : LImages.darkApplogo),
          ),
          const SizedBox(height: LSizes.md),
          Text(
            tr(LocaleKeys.loginTitle),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: LSizes.sm),
          Text(
            tr(LocaleKeys.loginSubTitle),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
