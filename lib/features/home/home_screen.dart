import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/home/widgets/home_card.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = LHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text('Home', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
                child: Text(LTexts.notizieTitle,
                    style: Theme.of(context).textTheme.headlineMedium)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(color: darkMode ? LColors.light : LColors.dark),
          ),
          const HomeCard(
            image: AssetImage(LImages.homeImage1),
            title: 'Título 1',
            subtitle: 'Subtitle',
            description: 'this is a little description.',
            paragraph:
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen',
            phoneNumber: '12345',
            mapUrl: '40.35557664062484, 18.172805504054864',
          ),
          const HomeCard(
            image: AssetImage(LImages.homeImage2),
            title: 'Título 2',
            subtitle: 'Subtitle',
            description: 'This is a little description.',
            paragraph:
                'Lorem Ipsum es simplemente el texto de relleno e las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen',
            phoneNumber: '12345',
            mapUrl: '40.35557664062484, 18.172805504054864',
          ),
          const HomeCard(
            image: AssetImage(LImages.homeImage3),
            title: 'Título 3',
            subtitle: 'Subtitle',
            description: 'This is a little description.',
            paragraph:
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen',
          ),
          // add more cards here
        ],
      ),
    );
  }
}
