import 'package:applichiamoci/features/screens/home/models/news_model.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/exceptions/firebase_exceptions.dart';
import 'package:applichiamoci/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // Get all categoires
  Future<List<NewsModel>> getAllNews() async {
    try {
      final snapshot = await _db.collection('News').get();
      final list = snapshot.docs
          .map((document) => NewsModel.fromSnapshot(document))
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
