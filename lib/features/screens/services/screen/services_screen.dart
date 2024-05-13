import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/shimmer/category_shimmer.dart';
import 'package:applichiamoci/features/screens/services/controllers/services_controller.dart';
import 'package:applichiamoci/features/screens/services/screen/widgets/service_card.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceController = Get.find<ServiceController>();

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text(tr(LocaleKeys.servizi),
              style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LSizes.sm),
        child: Obx(() {
          // Si todavia no cargaron las categorias muestra el shimmer personalizado
          if (serviceController.isLoading.value) {
            return const LServiceShimmer(itemCount: 8);
          }
          // Cuando las categorias estan cargadas genera la grid de categorias
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: serviceController.allServices.length,
            itemBuilder: (_, index) {
              final service = serviceController.allServices[index];
              return LServiceCard(service: service);
            },
          );
        }),
      ),
    );
  }
}
