import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperModels {
  final String url;
  final String category;

  WallpaperModels({required this.url, required this.category});

  static WallpaperModels fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return WallpaperModels(
      url: snapshot['image_url'],
      category: snapshot['tag'],
    );
  }
}
