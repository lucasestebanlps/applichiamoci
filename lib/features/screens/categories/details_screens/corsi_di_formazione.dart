import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';

class CorsiDiFormazione extends StatelessWidget {
  const CorsiDiFormazione({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Corsi di formazione', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Maria dell\'Idria', description: 'Corso di Italiano: Martedì h. 8:30/12:00'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa di San Niccolò dei Greci', description: 'Corso di Italiano (durata 2 anni) *Servizio sospeso causa Covid*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Centro di Prossimità Casa Comune', description: 'Corso di Italiano: Martedì h. 9:30-11:30 /Venerdì h. 9:30-11:30 *SOSPESO*'),   
        ],
      ),
    );
  }
}