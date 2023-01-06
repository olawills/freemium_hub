import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:photo_view/photo_view_gallery.dart';

class WallpaperView extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>> image;
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
  // late String image;
  late PageController _pageController;

  @override
  void initState() {
    // image = widget.image[widget.currentIndex];
    _pageController = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: PageView.builder(
              itemCount: widget.image.length,
              onPageChanged: (index) {
                setState(() {});
              },
              controller: _pageController,
              itemBuilder: (BuildContext context, index) {
                return ExtendedImage.network(
                  widget.image[index].get('image_url'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                );
              },
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(40),
                height: 150,
                width: 10,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 80,
                          width: 100,
                          child: CircleAvatar(
                            // radius: 20,
                            backgroundColor: DarkThemeColors.darkThemeAppbar,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )),
                    const SizedBox(width: 3),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 120,
                          width: 80,
                          child: CircleAvatar(
                            // radius: 20,
                            backgroundColor: DarkThemeColors.darkThemeAppbar,
                            child: const Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )),
                    const SizedBox(width: 3),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 80,
                        width: 100,
                        child: CircleAvatar(
                          // radius: 20,
                          backgroundColor: DarkThemeColors.darkThemeAppbar,
                          child: const Icon(
                            Icons.wallpaper,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
