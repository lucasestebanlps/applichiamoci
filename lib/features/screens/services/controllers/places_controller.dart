import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/categories/places_repository.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class PlacesController extends GetxController {
  static PlacesController get instance => Get.find();

  final isLoading = false.obs;
  final _placesRepository = PlacesRepository(); // Cambiado aquí
  RxList<PlaceModel> placesForServices = <PlaceModel>[].obs;

  // Nueva propiedad para almacenar el servicio actual
  String? currentService;

  // Load places data for a specific service
  Future<void> fetchPlacesForService(String? service) async {
    try {
      // si no hay lugares
      if (service == null) {
        return;
      }

      // Show loader while loading places
      isLoading.value = true;

      // Limpiar la lista de lugares al cambiar de servicio
      placesForServices.clear();

      // Fetch places for the specific service using PlacesRepository
      final places = await _placesRepository.getPlacesForService(service);

      // Update the places list
      placesForServices.assignAll(places);

      isLoading.value =
          false; // Desactivar el loader después de cargar los lugares
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    }
  }
}
