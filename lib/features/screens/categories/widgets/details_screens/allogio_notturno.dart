import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class AllogioNotturno extends StatelessWidget {
  const AllogioNotturno({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text('Allogio Notturno', style: Theme.of(context).textTheme.headlineSmall!),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'S. Maria della Porta', description: 'Casa Idria "Il Cammino": per i 4 primi quattro mesi non pagano niente: da 5° mese il 30 %, (solo uomini) Requisiti di ingresso: documentazione'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Maria dell\'Idria', description: 'Casa alloggio (Caritas) *volontarie vincenziane'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Fondazione casa della carità', description: 'Casa alloggio per convalescenti: aperto tutti i giorni *Servizio Gerico*'),
        ],
      ),
    );
  }
}