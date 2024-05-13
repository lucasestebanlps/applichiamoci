import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/data/repositories/categories/categories_repository.dart';
import 'package:applichiamoci/features/screens/services/models/service_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();

  final isLoading = false.obs;
  final _serviceRepository = Get.put(ServiceRepository());
  RxList<ServiceModel> allServices = <ServiceModel>[].obs;
  List<String> loadedServices =
      []; // Lista para almacenar los servicios ya cargados

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  // Load services data
  Future<void> fetchServices() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch services using _servicesRepository
      final services = await _serviceRepository.getAllServices();

      // Update the services list
      allServices.assignAll(services);
    } catch (e) {
      LLoaders.errorSnackBar(
          title: tr(LocaleKeys.error), message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
