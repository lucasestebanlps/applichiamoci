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
        mainAxisAlignment: MainAxisAlignment.start, // Alineación a la izquierda
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 100,
            image:
                AssetImage(dark ? LImages.lightApplogo : LImages.darkApplogo),
          ),
          const SizedBox(height: LSizes.md),
          Text(
            tr(LTexts.loginTitle),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: LSizes.sm),
          Text(
            tr(LTexts.loginSubTitle),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
