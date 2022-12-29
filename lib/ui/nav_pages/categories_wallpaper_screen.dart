import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WallpaperCategories extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  const WallpaperCategories({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<WallpaperCategories> createState() => _WallpaperCategoriesState();
}

class _WallpaperCategoriesState extends State<WallpaperCategories> {
  final List<String> categories = [];
  final List<String> categoryImages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wallpaper Category'),
      ),
    );
  }
}
