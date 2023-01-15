import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperModels {
  final String url;
  final String category;
  final String favoriteId;
  bool isFavorites;

  WallpaperModels({
    required this.url,
    required this.category,
    required this.favoriteId,
    this.isFavorites = false,
  });

  static WallpaperModels fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return WallpaperModels(
      url: snapshot['image_url'],
      category: snapshot['tag'],
      favoriteId: snapshot.id,
      isFavorites: false,
    );
  }
}
