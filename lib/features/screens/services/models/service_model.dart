import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String id;
  String name;
  String icon;
  String backgroundColor;

  ServiceModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.backgroundColor,
  });

  // Empty helper function
  static ServiceModel empty() =>
      ServiceModel(id: '', name: '', icon: '', backgroundColor: '');

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'backgroundColor': backgroundColor,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory ServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return ServiceModel(
        id: document.id,
        name: data['name'] ?? '',
        icon: data['icon'] ?? '',
        backgroundColor: data['backgroundColor'] ?? '',
      );
    } else {
      return ServiceModel.empty();
    }
  }
}
