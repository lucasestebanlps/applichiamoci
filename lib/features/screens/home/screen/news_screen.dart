import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/features/screens/home/controllers/news_controller.dart';
import 'package:applichiamoci/features/screens/home/screen/widgets/news_card.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put<NewsController>(NewsController());

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text(tr(LTexts.notizieTitle),
              style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeController.allNews.isEmpty) {
          return LErrorCenteredText(
            icon: Icons.warning,
            text: tr(LTexts.noNews),
          );
        } else {
          return ListView.builder(
            itemCount: homeController.allNews.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(
                home: homeController.allNews[index],
              );
            },
          );
        }
      }),
    );
  }
}
