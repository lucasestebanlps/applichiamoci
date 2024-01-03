import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class OrientamentoLegale extends StatelessWidget {
  const OrientamentoLegale({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Orientamiento Legale', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia S.Pio X (Quartiere Rudiae-Ferrovia', description: 'Mercoledì h.9:30.11:00 Supporto legale ed economico presentando Modello isee 7500 euro + documenti familiari; Organizzazione in base alle esigenze personali dei parrocchiani'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Massimiliano Kolbe', description: 'CAF Volontariato ogni martedì h. 9:30/11:30 - Servizio assistenza fiscale tutti i martedi h. 9:30/11:30'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia S. Bernardino Realino', description: 'Aiuti Extra *NON calendarizzati* su richiesta dei parrocchiani'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Centro di Prossimità Casa Comune', description: 'Orientamento Economico-Legale dal lunedì al sabato h. 14:00-18:00'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Fondazione Casa della Carità', description: 'Orientamento economico-legale: tutti i giorni h.08:00-20:00'),
   
        ],
      ),
    );
  }
}