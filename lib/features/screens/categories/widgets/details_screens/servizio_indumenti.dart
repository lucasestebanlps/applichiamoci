import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ServizioIndumenti extends StatelessWidget {
  const ServizioIndumenti({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Servizio Indumenti', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia S.Pio X (Quartiere Rudiae-Ferrovia', description: 'Distribuzione e all\'occorrenza ritiro vestiti in buone condizioni'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia S. Bernardino Realino', description: 'Ritiro indumenti*SOSPESA CAUSA COVID* Bidone indumenti posto fuori dalla parrocchia *SOSPESA CAUSA COVID*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Cuore di Gesu\'', description: 'Distribuzione indumenti *SOSPESA CAUSA COVID*')
        ],
      ),
    );
  }
}