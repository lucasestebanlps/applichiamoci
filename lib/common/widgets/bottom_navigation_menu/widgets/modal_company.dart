import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ModalCompany extends StatelessWidget {
  const ModalCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Iconsax.message_question,
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
                    .cardRadiusSm),
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
                  onPressed: () => LHelperFunctions.urlAction(
                      'https://fondazione-emmanuel.org'),
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
