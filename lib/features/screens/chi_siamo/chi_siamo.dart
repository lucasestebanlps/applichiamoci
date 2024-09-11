import 'package:applichiamoci/utils/helpers/helper_functions.dart';
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
        child: Column(
          children: [
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
                  Text(
                    softWrap: true,
                    tr(LocaleKeys.fondazioneInfo),
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
                    tr(LocaleKeys.applichiamociInfo),
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: LSizes.md),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(height: LSizes.md),

                  // Títulos de las secciones
                  Text(
                    tr(LocaleKeys.ourPartners),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: LSizes.md),
                  Padding(
                    padding: const EdgeInsets.all(LSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tr(LocaleKeys.capofila),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  // Logo de la fundación centrado
                  Center(
                    child: Image.asset(
                      ImagePaths.logoEmmanuel,
                      width: 120.0, // Ajustar el ancho según sea necesario
                    ),
                  ),
                  const SizedBox(height: LSizes.md),

                  Padding(
                    padding: const EdgeInsets.all(LSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tr(LocaleKeys.finanziatori),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  _buildPartnerLogos(
                    context,
                    [
                      {
                        'path': ImagePaths.regionePuglia,
                        'url': 'https://www.regione.puglia.it'
                      },
                      {
                        'path': ImagePaths.unisalento,
                        'url': 'https://www.unisalento.it'
                      },
                      {
                        'path': ImagePaths.disus,
                        'url': 'https://www.unisalento.it'
                      },
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(LSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tr(LocaleKeys.iCollaboratori),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  _buildPartnerLogos(
                    context,
                    [
                      {
                        'path': ImagePaths.logoComune,
                        'url': 'https://www.comune.it'
                      },
                      {
                        'path': ImagePaths.lavoroPoliticheSociali,
                        'url': 'https://www.lavoro.puglia.it'
                      },
                      {
                        'path': ImagePaths.logoDivagare,
                        'url': 'https://www.divagare.it'
                      },
                      {
                        'path': ImagePaths.logoHumanfirst,
                        'url': 'https://www.humanfirst.it'
                      },
                      {
                        'path': ImagePaths.noname,
                        'url': 'https://www.noname.it'
                      },
                      {
                        'path': ImagePaths.quiSalento,
                        'url': 'https://www.qui-salento.it'
                      },
                      {
                        'path': ImagePaths.cameraAvvocati,
                        'url': 'https://www.cameraavvocati.it'
                      },
                    ],
                  ),
                  const SizedBox(height: LSizes.md),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartnerLogos(
      BuildContext context, List<Map<String, String>> logos) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LSizes.defaultSpace),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 15, // Espacio horizontal entre las imágenes
        runSpacing: 10, // Espacio vertical entre las filas
        children: logos.map((logo) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 3 -
                10, // Ajuste de ancho basado en el número de columnas
            height: MediaQuery.of(context).size.width / 3 -
                20, // Mantiene las imágenes cuadradas
            child: GestureDetector(
              onTap: () {
                LHelperFunctions.urlAction(logo['url']!);
              },
              child: Image.asset(
                logo['path']!,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
