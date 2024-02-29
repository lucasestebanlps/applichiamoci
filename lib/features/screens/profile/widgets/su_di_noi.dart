import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';

class SuDiNoi extends StatelessWidget {
  const SuDiNoi({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(tr(LTexts.sopraNoi)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/sopra_noi/LogoTrasparente_schermata.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  dark
                      ? 'assets/images/sopra_noi/SFONDO_NERO/Animazione_applichiamoci_bianco.gif'
                      : 'assets/images/sopra_noi/SFONDO_BIANCO/Animazione_applichiamoci.gif',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Image.asset(
              dark
                  ? 'assets/images/sopra_noi/SFONDO_NERO/loghi-partner_bianco.gif'
                  : 'assets/images/sopra_noi/SFONDO_BIANCO/loghi-partner.gif',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
