// detail_screen.dart
import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String subtitle;
  final String paragraph;

  const HomeDetailScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle, 
      required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Column(children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: image),
              const SizedBox(height: LSizes.spaceBtwItems),
          
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: LSizes.spaceBtwItems /2),
              Text(paragraph,
                style: Theme.of(context).textTheme.bodyMedium
              ),
              const SizedBox(height: LSizes.spaceBtwSections),
              const ActionButtons()
          
             
            ],
          ),
        ),
      ),
    );
  }
}
