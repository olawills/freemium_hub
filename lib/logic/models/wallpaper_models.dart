import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freemium_hub/data/cubit_imports.dart';

class WallpaperModels extends Equatable {
  final String url;
  final String category;
  final String favoriteId;
  bool? isFavorites;

  WallpaperModels({
    required this.url,
    required this.category,
    required this.favoriteId,
    this.isFavorites,
  });

  static WallpaperModels fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return WallpaperModels(
      url: snapshot['image_url'],
      category: snapshot['tag'],
      favoriteId: snapshot.id,
      isFavorites: false,
    );
  }

  @override
  List<Object?> get props => [
        url,
        category,
        favoriteId,
        isFavorites,
      ];
}
