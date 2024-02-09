import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LLoginHeader extends StatelessWidget {
  const LLoginHeader({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ancho igual al ancho de la pantalla
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Alineación a la izquierda
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: LSizes.md),
          Image(
            height: 100,
            image: AssetImage(dark ? LImages.lightApplogo : LImages.darkApplogo),
          ),
          SizedBox(height: LSizes.md),
          Text(
            LTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: LSizes.sm),
          Text(
            LTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}