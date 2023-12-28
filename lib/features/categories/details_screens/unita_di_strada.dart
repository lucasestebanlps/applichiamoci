import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/categories/widgets/details_card.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class UnitaDiStrada extends StatelessWidget {
  const UnitaDiStrada({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text('Unita di strada', style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: ListView(
        children: const [
          DetailsCard(image: AssetImage(LImages.onBoardingImage1), title: 'title', description: 'description'),
          DetailsCard(image: AssetImage(LImages.onBoardingImage1), title: 'title', description: 'description'),
          DetailsCard(image: AssetImage(LImages.onBoardingImage1), title: 'title', description: 'description'),
          DetailsCard(image: AssetImage(LImages.onBoardingImage1), title: 'title', description: 'description'),
          DetailsCard(image: AssetImage(LImages.onBoardingImage1), title: 'title', description: 'description'),
        ],
      ),
    );
  }
}