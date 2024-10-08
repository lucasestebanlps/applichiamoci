import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/text/error_text_icon.dart';
import 'package:applichiamoci/features/screens/news/controllers/news_controller.dart';
import 'package:applichiamoci/features/screens/news/screen/widgets/news_card.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.find<NewsController>();

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: false,
        title: Column(children: [
          Text(tr(LocaleKeys.notizieTitle),
              style: Theme.of(context).textTheme.headlineSmall!)
        ]),
      ),
      endDrawer: const CustomDrawer(),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (newsController.allNews.isEmpty) {
          return LErrorCenteredText(
            icon: Icons.warning,
            text: tr(LocaleKeys.noNews),
          );
        } else {
          return ListView.builder(
            itemCount: newsController.allNews.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(
                home: newsController.allNews[index],
              );
            },
          );
        }
      }),
    );
  }
}
