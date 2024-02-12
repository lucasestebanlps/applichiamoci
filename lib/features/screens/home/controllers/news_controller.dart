import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/home/home_repository.dart';
import 'package:applichiamoci/features/screens/home/models/news_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  static NewsController get instance => Get.find();

  final isLoading = false.obs;
  final _homeRepository = Get.put(HomeRepository());
  RxList<NewsModel> allNews = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  // Load categories data
  Future<void> fetchNews() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories using _categoryRepository
      final news = await _homeRepository.getAllNews();

      // Update the categories list
      allNews.assignAll(news);
    } catch (e) {
      LLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}