import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ServizioRistoro extends StatelessWidget {
  const ServizioRistoro({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Servizi Risorto', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa Cattolica Parrocchiale Ss. Trinita\'96', description: 'Dispensa delle offerte'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa di San Niccolò dei Greci', description: 'Servizio Mensa domenicale ogni 15 giorni *SERVIZIO SOSPESO CAUSA COVID-19*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Sant Antonio da Padova Fulgenzio', description: 'Servizio Ristoro h.19.00-20.00 (da asporto). Dispensa solidale -NUMERO 153- prima domenica del mese offerta dai parrocchiani.'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia San Lazzaro', description: 'Servizio Ristoro h.19.00-20.00 (da asporto). Servizio Mensa domenicale h.12.00 (da asporto).'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia S.Pio X (Quartiere Rudiae-Ferrovia)', description: 'Distribuzione di viveri: banco delle opere di Alessano (ogni 20 giorni per le famiglie sia della parrocchia che non)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Caritas Parrocchiale Santa Rosa', description: 'Servizio Mensa: dal Lunedì al Sabato h12.00; Dispensa con distribuzione pacchi ai soli residenti della parrocchia (ogni 15 g. il Lunedi h. 9:00-11/ 17:00-18:00 (per usufruire presentare dichiarazione dei redditi)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa Parrocchiale Salesiana S.Domenico Savio', description: 'Servizio Mensa *SOSPESO*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia San Giovanni Maria Vianney', description: 'Conegna pacco di viveri in base alle richeste e necessità'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Massimiliano Kolbe', description: 'Punto ristoro h. 17:30 (tutti i giorni). Distribuzione alimenti ogni 1^ Lunedi del mese'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Sabino', description: 'Punto Ristoro h.8:30-10:30 (tutti i giorni)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Giovanni Battista', description: 'Pacco Alimentare: domenica h.12:00; Pacco viveri 1°volta al mese (solo ai residenti della parrocchia)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: "Chiesa S. Cuore di Gesu'", description: 'Servizio Mensa: h.19:00-20:00 dal Lunedì al Sabato;*SOSPESO CAUSA COVID* Caritas: pacchi viveri 4 volte al mese per Famiglie extracomunitarie'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa San Guido', description: 'CARITAS GRUPPO FRATRES'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Lucia', description: 'Caritas: Distribuzione dei generi alimentari Raccolta generi alimentari: 2ª domenica del mese Distribuzione pacchetti calendarizzata (servizio rivolto ai parrocchiani)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa S. Maria delle Grazie', description: 'Servizio Mensa *SOSPESO CAUSA COVID*'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Parrocchia Cattedrale', description: 'Servizio Ristoro Caritas: h.19:00-20:00 (tutti i giorni)'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Chiesa San Luigi Gonzaga', description: 'Sacchetto Alimentare: Lunedì/Mercoledì/Venerdì'),
          DetailsCard(phoneNumber: '3398089872', mapUrl: '40.35557664062484, 18.172805504054864', image: AssetImage(LImages.onBoardingImage1), title: 'Fondazione Casa della Carità', description: 'Sacchetto alimentare/ pacco alimentare: tutti i giorni h.12:00'),
        ],
      ),
    );
  }
}