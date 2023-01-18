import 'package:flutter/material.dart';
import 'package:freemium_hub/logic/models/wallpaper_models.dart';

class FavoritePage extends StatefulWidget {
  // final WallpaperModels wallpaper;
  final List<WallpaperModels> wallpaperModels;
  const FavoritePage({
    Key? key,
    required this.wallpaperModels,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
