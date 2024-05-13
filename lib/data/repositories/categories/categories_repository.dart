import 'package:applichiamoci/features/screens/services/models/service_model.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ServiceRepository extends GetxController {
  static ServiceRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all services
  Future<List<ServiceModel>> getAllServices() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) {
        final data = document.data();
        final name = LHelperFunctions.getTranslatedField(data, 'name');
        return ServiceModel(
          id: document.id,
          name: name,
          icon: data['icon'],
          backgroundColor: data['backgroundColor'],
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
