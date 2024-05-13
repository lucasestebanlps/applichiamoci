import 'package:applichiamoci/features/screens/news/models/news_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NewsRepository extends GetxController {
  static NewsRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // Get all services
  Future<List<NewsModel>> getAllNews() async {
    try {
      final snapshot = await _db.collection('News').get();
      final list = snapshot.docs.map((document) {
        final data = document.data();
        // Obtener los campos traducidos del documento
        final title = LHelperFunctions.getTranslatedField(data, 'title');
        final subtitle = LHelperFunctions.getTranslatedField(data, 'subtitle');
        final description =
            LHelperFunctions.getTranslatedField(data, 'description');

        // Crear una instancia de NewsModel con los campos traducidos
        return NewsModel(
          id: document.id,
          title: title,
          subtitle: subtitle,
          description: description,
          phoneNumber: data['phoneNumber'] ?? '',
          image: data['image'],
          mapCoordinates: data['mapCoordinates'],
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
