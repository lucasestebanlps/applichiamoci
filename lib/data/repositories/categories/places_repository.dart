import 'package:applichiamoci/features/screens/services/models/place_model.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlacesRepository extends GetxController {
  static PlacesRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get places for a specific service
  Future<List<PlaceModel>> getPlacesForService(String service) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .doc(service)
          .collection('Places')
          .get();

      final list = snapshot.docs.map((document) {
        final data = document.data();
        final description =
            LHelperFunctions.getTranslatedField(data, 'description');
        final ownerName =
            LHelperFunctions.getTranslatedField(data, 'ownerName');
        final category = LHelperFunctions.getTranslatedField(data, 'category');
        return PlaceModel(
          id: document.id,
          title: data['title'],
          description: description,
          direction: data['direction'],
          phoneNumber: data['phoneNumber'],
          mapCoordinates: data['mapCoordinates'],
          image: data['image'],
          ownerName: ownerName,
          email: data['email'],
          website: data['website'],
          category: category,
          serviceId: service,
        );
      }).toList();

      return list;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw tr(LocaleKeys.somethingWentWrong);
    }
  }
}
