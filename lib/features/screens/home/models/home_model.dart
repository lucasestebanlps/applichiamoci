import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  final String id;
  final String? image;
  final String title;
  final String subtitle;
  final String description;
  final String paragraph;
  final String? phoneNumber;
  final String? mapUrl;

  HomeModel({
    this.image = '',
    this.subtitle = '',
    this.phoneNumber,
    this.mapUrl,
    required this.id,
    required this.description,
    required this.title,
    required this.paragraph,
  });

  // Empty helper function
  static HomeModel empty() => HomeModel(
      id: '',
      title: '',
      paragraph: '',
      description: '',
      image: '',
      subtitle: '',
      phoneNumber: '',
      mapUrl: '');

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'paragraph': paragraph,
      'description': description,
      'image': image,
      'phoneNumber': phoneNumber,
      'mapUrl': mapUrl,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory HomeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return HomeModel(
        id: document.id,
        title: data['title'] ?? '',
        subtitle: data['subtitle'] ?? '',
        description: data['description'] ?? '',
        paragraph: data['paragraph'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        image: data['image'] ?? '',
        mapUrl: data['mapUrl'] ?? '',
      );
    } else {
      return HomeModel.empty();
    }
  }
}
