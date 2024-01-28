import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class OrientamentoLavorativo extends StatelessWidget {
  const OrientamentoLavorativo({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Orientamiento Lavorativo', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia San Giovanni Maria Vianney', description: 'Supporto e accompagnamento Badanti'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Centro di Prossimità Casa Comune', description: 'Orientamento Lavorativo dal lunedì al sabato h. 14:00-18:00'),
        ],
      ),
    );
  }
}