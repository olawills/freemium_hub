import 'package:flutter/material.dart';

class WallpaperCategories extends StatefulWidget {
  const WallpaperCategories({Key? key}) : super(key: key);

  @override
  State<WallpaperCategories> createState() => _WallpaperCategoriesState();
}

class _WallpaperCategoriesState extends State<WallpaperCategories> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wallpaper Category'),
      ),
    );
  }
}
