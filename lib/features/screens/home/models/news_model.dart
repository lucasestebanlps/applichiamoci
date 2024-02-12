import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String id;
  final String? image;
  final String title;
  final String subtitle;
  final String description;
  final String paragraph;
  final String? phoneNumber;
  final String? mapCoordinates;

  NewsModel({
    this.image = '',
    this.subtitle = '',
    this.phoneNumber,
    this.mapCoordinates,
    required this.id,
    required this.description,
    required this.title,
    required this.paragraph,
  });

  // Empty helper function
  static NewsModel empty() => NewsModel(
      id: '',
      title: '',
      paragraph: '',
      description: '',
      image: '',
      subtitle: '',
      phoneNumber: '',
      mapCoordinates: '');

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'paragraph': paragraph,
      'description': description,
      'image': image,
      'phoneNumber': phoneNumber,
      'mapCoordinates': mapCoordinates,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory NewsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return NewsModel(
        id: document.id,
        title: data['title'] ?? '',
        subtitle: data['subtitle'] ?? '',
        description: data['description'] ?? '',
        paragraph: data['paragraph'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        image: data['image'] ?? '',
        mapCoordinates: data['mapCoordinates'] ?? '',
      );
    } else {
      return NewsModel.empty();
    }
  }
}
