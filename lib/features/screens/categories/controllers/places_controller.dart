import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/categories/places_repository.dart';
import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
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
            title: 'Error', message: 'we cant find categories');
        return;
      }

      // Verificar si la categoría actual es diferente a la nueva categoría
      if (currentCategory != categoria) {
        // Show loader while loading places
        isLoading.value = true;

        // Limpiar la lista de lugares al cambiar de categoría
        placesForCategory.clear();

        // Fetch places for the specific category using PlacesRepository
        final places = await _placesRepository.getPlacesForCategory(categoria);

        // Update the places list
        placesForCategory.assignAll(places);

        // Actualizar la categoría actual
        currentCategory = categoria;

        isLoading.value =
            false; // Desactivar el loader después de cargar los lugares
      }
    } catch (e) {
      LLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
