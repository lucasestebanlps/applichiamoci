import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/categories/places_repository.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class PlacesController extends GetxController {
  static PlacesController get instance => Get.find();

  final isLoading = false.obs;
  final _placesRepository = PlacesRepository(); // Cambiado aquí
  RxList<PlaceModel> placesForCategory = <PlaceModel>[].obs;

  // Nueva propiedad para almacenar la categoría actual
  String? currentCategory;

  // Load places data for a specific category
  Future<void> fetchPlacesForCategory(String? categoria) async {
    try {
      // si no hay categorias
      if (categoria == null) {
        LLoaders.errorSnackBar(
            title: tr(LocaleKeys.error),
            message: tr(LocaleKeys.noCategoriesError));
        return;
      }

      // Show loader while loading places
      isLoading.value = true;

      // Limpiar la lista de lugares al cambiar de categoría
      placesForCategory.clear();

      // Fetch places for the specific category using PlacesRepository
      final places = await _placesRepository.getPlacesForCategory(categoria);

      // Update the places list
      placesForCategory.assignAll(places);

      isLoading.value =
          false; // Desactivar el loader después de cargar los lugares
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    }
  }
}
