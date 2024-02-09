import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String icon;
  int backgroundColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.backgroundColor,
  });

  // Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', icon: '', backgroundColor: 0);

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'backgroundColor': backgroundColor,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return CategoryModel(
          id: document.id,
          name: data['name'] ?? '',
          icon: data['icon'] ?? '',
          backgroundColor: data['backgroundColor'] ?? '',
        );
    } else {
      return CategoryModel.empty();
    }
  }
}
