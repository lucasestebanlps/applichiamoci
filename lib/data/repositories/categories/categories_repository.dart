import 'package:applichiamoci/features/screens/categories/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) {
        final data = document.data();
        final name = _getTranslatedName(data);
        return CategoryModel(
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

  String _getTranslatedName(Map<String, dynamic>? data) {
    // Obtén el idioma actual de la aplicación
    var currentLocale = EasyLocalization.of(Get.context!)!.locale.toString();

    // Consulta el campo de nombre según el idioma actual
    var translatedName = data?['name_$currentLocale'];

    // Si no hay una traducción para el idioma actual, usa el nombre predeterminado
    if (translatedName == null || translatedName.isEmpty) {
      translatedName = data?['name'];
    }

    return translatedName ?? '';
  }
}
