import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/news/news_repository.dart';
import 'package:applichiamoci/features/screens/news/models/news_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  static NewsController get instance => Get.find();

  final isLoading = false.obs;
  final _newsRepository = Get.put(NewsRepository());
  RxList<NewsModel> allNews = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  // Load news data
  Future<void> fetchNews() async {
    try {
      // Show loader while loading news
      isLoading.value = true;

      // Fetch news using _newsRepository
      final news = await _newsRepository.getAllNews();

      // Update the news list
      allNews.assignAll(news);
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
