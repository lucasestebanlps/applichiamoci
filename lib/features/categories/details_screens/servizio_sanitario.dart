import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ServizioSanitario extends StatelessWidget {
  const ServizioSanitario({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Servizio Sanitario', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Giovanni Battista', description: 'Medici volontari *solo per parrocchiani*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Centro di Prossimità Casa Comune', description: 'Dal lunedì al sabato h. 14:00-18:00'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa di San Niccolò dei Greci', description: 'Progetto sanitario finanziato dalla Comunità Europea: rivolto a immigrati non residenti; Incontri con volontari Ospedale di Lecce (durata 5 anni); *SERVIZI SOSPESI CAUSA COVID*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Maria dell\'Idria', description: 'Ambulatorio Diocesano Caritas: dal Lunedì al Ven. h. 10:00-12:00'),
        ],
      ),
    );
  }
}