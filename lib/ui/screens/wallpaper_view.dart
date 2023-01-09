import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:freemium_hub/widgets/show_modal_sheet.dart';
import 'package:freemium_hub/widgets/wallpaper_dialog.dart';

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

class _WallpaperViewState extends State<WallpaperView>
    with AutomaticKeepAliveClientMixin {
   late int currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    
    currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: PageView.builder(
              itemCount: widget.image.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _pageController,
              itemBuilder: (BuildContext context, index) {
                return ExtendedImage.network(
                  widget.image[index].get('image_url'),
                  // fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                  colorBlendMode: BlendMode.darken,
                );
              },
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      // code to share
                    },
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      child: const Icon(Icons.share),
                      onTap: () {
                        // code to share
                      },
                    ),
                  ),
                ],
              ),
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
                        child: SizedBox(
                          height: 90,
                          width: 80,
                          child: InkResponse(
                            onTap: () {},
                            child: CircleAvatar(
                              // radius: 20,
                              backgroundColor: DarkThemeColors.darkThemeAppbar,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 90,
                        width: 80,
                        child: InkResponse(
                          onTap: () {},
                          child: CircleAvatar(
                            // radius: 20,
                            backgroundColor: DarkThemeColors.darkThemeAppbar,
                            child: const Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 90,
                        width: 80,
                        child: InkResponse(
                          onTap: () async {
                            await setWallpaperDialogBox(
                              context,
                              setOnpressed: () {
                                Navigator.pop(context);
                                showActionSheet(
                                  context: context,
                                   url: widget.image[currentIndex]
                                      .get('image_url'),
                                );
                              },
                              shareOnpressed: () {},
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: DarkThemeColors.darkThemeAppbar,
                            child: const Icon(
                              Icons.wallpaper,
                              color: Colors.white,
                              size: 30,
                            ),
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
