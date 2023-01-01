import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class WallpaperView extends StatefulWidget {
  final String image;
  const WallpaperView({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<WallpaperView> createState() => _WallpaperViewState();
}

class _WallpaperViewState extends State<WallpaperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Expanded(
          //   child: Image.network(
          //     widget.snapshot.get('image_url'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ExtendedImage.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
