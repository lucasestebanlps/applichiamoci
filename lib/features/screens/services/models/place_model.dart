import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String id;
  String title;
  String description;
  String? direction;
  String? phoneNumber;
  String? mapCoordinates;
  String? image;
  String? ownerName;
  String? email;
  String? website;
  String? category;
  String serviceId; // Nuevo campo para la relación con el servicio

  PlaceModel({
    required this.id,
    required this.title,
    required this.description,
    this.phoneNumber,
    this.direction,
    this.mapCoordinates,
    this.image,
    this.ownerName,
    this.email,
    this.website,
    this.category,
    required this.serviceId, // Asegúrarse de pasarlo en el constructor
  });

  // Empty helper function
  static PlaceModel empty() => PlaceModel(
      id: '',
      title: '',
      description: '',
      direction: '',
      image: '',
      mapCoordinates: '',
      ownerName: '',
      email: '',
      website: '',
      category: '',
      phoneNumber: '',
      serviceId: '');

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'phoneNumber': phoneNumber,
      'direction': direction,
      'mapCoordinates': mapCoordinates,
      'image': image,
      'ownerName': ownerName,
      'email': email,
      'website': website,
      'category': category,
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
        direction: data['direction'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        mapCoordinates: data['mapCoordinates'] ?? '',
        image: data['image'] ?? '',
        ownerName: data['ownerName'] ?? '',
        category: data['category'] ?? '',
        email: data['email'] ?? '',
        website: data['website'] ?? '',
        serviceId: document.reference.parent.id,
      );
    } else {
      return PlaceModel.empty();
    }
  }
}
