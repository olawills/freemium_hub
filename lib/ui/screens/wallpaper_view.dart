import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class WallpaperView extends StatefulWidget {
  final String image;
  final int currentIndex;
  const WallpaperView({
    Key? key,
    required this.image,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<WallpaperView> createState() => _WallpaperViewState();
}

class _WallpaperViewState extends State<WallpaperView> {
  late String image;
  late PageController _pageController;

  @override
  void initState() {
    image = widget.image[widget.currentIndex];
    _pageController = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Container(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ExtendedImage.network(
              widget.image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
