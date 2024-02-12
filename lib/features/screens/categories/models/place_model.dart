import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String id;
  String title;
  String description;
  String? phoneNumber;
  String? mapCoordinates;
  String? image;
  String categoryId; // Nuevo campo para la relación con la categoría

  PlaceModel({
    required this.id,
    required this.title,
    required this.description,
    this.phoneNumber,
    this.mapCoordinates,
    this.image,
    required this.categoryId, // Asegúrarse de pasarlo en el constructor
  });

  // Empty helper function
  static PlaceModel empty() => PlaceModel(
      id: '',
      title: '',
      description: '',
      image: '',
      mapCoordinates: '',
      phoneNumber: '',
      categoryId: '');

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'phoneNumber': phoneNumber,
      'mapCoordinates': mapCoordinates,
      'image': image,
    };
  }

  // Map Json oriented document snapshot from Firebase to LugarModel
  factory PlaceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return PlaceModel(
        id: document.id,
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        mapCoordinates: data['mapCoordinates'] ?? '',
        image: data['image'] ?? '',
        categoryId: document.reference.parent.id,
      );
    } else {
      return PlaceModel.empty();
    }
  }
}
