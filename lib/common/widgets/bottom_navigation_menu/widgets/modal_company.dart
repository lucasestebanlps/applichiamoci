import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
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
              title: Text(LocaleKeys.companyNumber.tr()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(LSizes
                    .cardRadiusSm), // Cambia el radio de borde según lo necesites
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.companyExplanation.tr(),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Agrega aquí la lógica para ir al sitio web de la empresa
                  },
                  child: Text(tr(LocaleKeys.goToWebsite)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: Text(tr(LocaleKeys.cancel)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
