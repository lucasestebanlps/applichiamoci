// places_repository.dart

import 'package:applichiamoci/features/screens/categories/models/place_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlacesRepository extends GetxController {
  static PlacesRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Obtener lugares para una categoría específica
  Future<List<PlaceModel>> getPlacesForCategory(String caregory) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .doc(caregory)
          .collection('Places')
          .get();

      final list = snapshot.docs
          .map((document) => PlaceModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw LTexts.somethingWentWrong;
    }
  }
}
