import 'package:flutter/material.dart';
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/translations/locale_keys.g.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:easy_localization/easy_localization.dart';

class ChiSiamo extends StatelessWidget {
  const ChiSiamo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(tr(LocaleKeys.sopraNoi)),
      ),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Primera imagen con logo superpuesto
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      LImages.chiSiamoImg1,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Utilizamos Transform.translate dentro del Stack para ajustar la posición del logo
                    Transform.translate(
                      offset: const Offset(-15, 15),
                      child: Image.asset(
                        LImages.logoEmmanuel,
                        width: 80.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: LSizes.defaultSpace),
                // Texto explicativo sobre la fundacion
                Text(
                  softWrap: true,
                  'La Fondazione Emmanuel per le migrazioni e il Sud del Mondo nasce nel 1992 come braccio operativo della Comunità Emmanuel. È un’Organizzazione Non Governativa, Ente del Terzo Settore e opera da oltre 25 anni sul territorio locale, nazionale e internazionale. '
                  'Vuole promuovere, incoraggiare e sostenere le iniziative atte a creare le condizioni e fornire gli strumenti per l’autodeterminazione dei popoli del Sud d’Italia, d’Europa e del Mondo, in adempimento ai doveri di solidarietà sociale sanciti dalla Carta delle Nazioni Unite. '
                  'Con particolare attenzione verso i migranti e le popolazioni, vicine e lontane, che più soffrono gli squilibri del pianeta. '
                  'Tra i principi e valori fondanti della Fondazione Emmanuel ritroviamo: partecipazione sociale e cittadinanza attiva; giustizia sociale; promozione del dialogo tra culture e religioni diverse; rispetto dei diritti umani e della democrazia; tutela dell’ambiente e sviluppo sostenibile.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: LSizes.md),
                const Divider(),
                const SizedBox(height: LSizes.md),

                // Segunda imagen con otro logo superpuesto
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      LImages.chiSiamoImg2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Transform.translate(
                      offset: const Offset(15, 15),
                      child: Image.asset(
                        LImages.logoApplichiamociChiSiamo,
                        width: 80.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: LSizes.defaultSpace),

                // Texto explicativo sobre applichiamoci
                Text(
                  'APPlichiAMOci è il risultato dell’esperienza maturata da Fondazione Emmanuel sul territorio, a stretto contatto con le esigenze e i bisogni delle persone soggette a disagio ed emarginazione sociale. '
                  'La convinzione che le nuove tecnologie possano essere una risorsa importante, in quanto offrono strumenti innovativi alle azioni di contrasto e contenimento dei fenomeni di disagio ed emarginazione sociale e la consapevolezza che tali fenomeni debbano essere affrontati in un’ottica collettiva, sono all’origine dell’idea di fondere insieme le parole APPLICAZIONE e AMORE dalle quali nasce il titolo APPlichiAMOci. '
                  'L’obiettivo consiste nel contrasto alle condizioni di svantaggio, disagio, emarginazione ed esclusione sociale attraverso il coinvolgimento degli attori e la società civile, attivi sul territorio e l’implementazione dei servizi di volontariato, tramite l’utilizzo di sistemi interattivi di facile accesso che connettano chi eroga i servizi con i destinatari. '
                  'Lo scopo è favorire lo sviluppo della cittadinanza attiva.',
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: LSizes.md),
              ],
            ),
          ),
          Container(
            color: Colors.white, // Color de fondo blanco
            child: Column(
              children: [
                const SizedBox(height: LSizes.md),
                Text(
                  'Our Partners:',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: LSizes.spaceBtwItems),
                Wrap(
                  alignment: WrapAlignment
                      .spaceEvenly, // Alineación entre los elementos
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing:
                      8.0, // Espacio vertical entre las filas de imágenes
                  children: ImagePaths.partnerLogos.map((path) {
                    return Image.asset(
                      path,
                      width: 80.0,
                    );
                  }).toList(),
                ),
                const SizedBox(height: LSizes.md),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
