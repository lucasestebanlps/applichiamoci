import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/categories/categories_repository.dart';
import 'package:applichiamoci/features/screens/categories/models/category_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  List<String> loadedCategories =
      []; // Lista para almacenar las categorías ya cargadas

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Load categories data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories using _categoryRepository
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);
    } catch (e) {
      LLoaders.errorSnackBar(title: LTexts.error, message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
