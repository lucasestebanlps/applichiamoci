import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/features/screens/home/controllers/home_controller.dart';
import 'package:applichiamoci/features/screens/home/screen/widgets/home_card.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put<HomeController>(HomeController());

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text(LTexts.notizieTitle, style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: homeController.allNews.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeCard(
                home: homeController.allNews[index],
              );
            },
          );
        }
      }),
    );
  }
}

