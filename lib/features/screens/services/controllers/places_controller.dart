import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/services/places_repository.dart';
import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class PlacesController extends GetxController {
  static PlacesController get instance => Get.find();

  final isLoading = false.obs;
  final _placesRepository = PlacesRepository();
  RxList<PlaceModel> placesForService = <PlaceModel>[].obs;
  RxList<String> services = <String>[].obs;
  String? currentService;

  List<PlaceModel> get filteredAndSortedPlaces {
    if (currentService == null || currentService!.isEmpty) {
      return placesForService;
    } else {
      List<PlaceModel> filteredPlaces = placesForService
          .where((place) => place.category == currentService)
          .toList();
      filteredPlaces.sort((a, b) => a.title.compareTo(b.title));
      return filteredPlaces;
    }
  }

  Future<void> fetchPlacesForServices(String? service) async {
    try {
      if (service == null) {
        return;
      }

      isLoading.value = true;
      placesForService.clear();
      final places = await _placesRepository.getPlacesForService(service);
      placesForService.assignAll(places);

      // Extracting categories
      Set<String> uniqueCategories = placesForService
          .map((place) => place.category)
          .where((category) => category != null)
          .map((category) => category!)
          .toSet();

      services.assignAll(uniqueCategories);

      isLoading.value = false;
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    }
  }

  void setCurrentService(String? service) {
    currentService = service;
    update(); // Notificar a la vista para que se actualice
  }
}
