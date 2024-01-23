
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CentroAscolto extends StatelessWidget {
  const CentroAscolto({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Centro Ascolto', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Caritas Parrocchiale Santa Rosa', description: 'Centro Ascolto ogni Lunedì h.9:00/11:00 - 16:00/18:00 *Assistente Sociale: Lia La Forgia*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia San Giovanni Maria Vianney', description: 'Centro Ascolto il I° e III° martedì di ogni mese h.9:30-11:30 (o su appuntamento) *Assistente Sociale Vanna Astore e volontari*'),          
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Massimiliano Kolbe', description: 'Centro Ascolto, Consulenza Sociale e Sostegno Psicologico.'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Centro di Prossimità Casa Comune', description: 'Centro Ascolto e Consulenza Sociale Dal lunedì al sabato h. 14:00-18:00'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Maria delle Grazie', description: 'Centro d\'ascolto settimanale Lunedì-Giovedì'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa San Luigi Gonzaga', description: 'Centro Ascolto: Lunedì/Mercoledì/Venerdì h.9:30-11:30'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Casa di Accoglienza “S. Caterina Labourè” - Ospedale “Vito Fazzi”: Servizio “Bimbulanza”', description: 'Centro Ascolto : Tutti i giorni h.09:30-12:00'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Sant\'Antonio da Padova Fulgenzio', description: 'Centro Ascolto'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia San Lazzaro', description: 'Centro Ascolto generico: martedì mattina h.9:30-10 (riferimento a professionisti volontari)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Lucia', description: 'Centro Ascolto (su richiesta dell\'utenza)'),
        ],
      ),
    );
  }
}