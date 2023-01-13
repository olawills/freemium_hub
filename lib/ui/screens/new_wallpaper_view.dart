import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemium_hub/models/wallpaper_models.dart';
import 'package:freemium_hub/widgets/bottom_widget.dart';
import 'package:freemium_hub/widgets/show_modal_sheet.dart';
import 'package:freemium_hub/widgets/wallpaper_dialog.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class NewWallpaperView extends StatefulWidget {
  final List<WallpaperModels> wallpaperImage;
  final int currentIndex;
  const NewWallpaperView({
    Key? key,
    required this.wallpaperImage,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<NewWallpaperView> createState() => _NewWallpaperViewState();
}

class _NewWallpaperViewState extends State<NewWallpaperView> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            // PhotoViewGallery.builder(
            //   pageController: _pageController,
            //   itemCount: widget.image.length,
            //   onPageChanged: (index) {
            //     setState(() {
            //       currentIndex = index;
            //     });
            //   },
            //   builder: (BuildContext context, index) {
            //     return PhotoViewGalleryPageOptions(
            //       imageProvider: ExtendedNetworkImageProvider(
            //         widget.image[index].get('image_url'),
            //       ),
            //     );
            //   },
            // ),
            PageView.builder(
              itemCount: widget.wallpaperImage.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _pageController,
              itemBuilder: (BuildContext context, index) {
                return ExtendedImage.network(
                  widget.wallpaperImage[index].url,
                  // fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                  colorBlendMode: BlendMode.darken,
                );
              },
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
            BottomWidget(
              downloadOnpressed: () async {
                var status = await Permission.storage.request();
                if (status.isGranted) {
                  try {
                    var downloadImage = await ImageDownloader.downloadImage(
                      widget.wallpaperImage[currentIndex].url,
                      destination: AndroidDestinationType.directoryPictures,
                    );
                    final snackBar = SnackBar(
                      content: const Text('Download Completed..'),
                      action: SnackBarAction(
                        label: 'Open',
                        onPressed: () async {
                          var path =
                              await ImageDownloader.findPath(downloadImage!);
                          await ImageDownloader.open(path!);
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } on PlatformException catch (error) {
                    print(error);
                  }
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Need Access to Storgae'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                openAppSettings();
                              },
                              child: const Text('Open Settings'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      });
                }
              },
             
              onPressed: () async {
                await setWallpaperDialogBox(
                  context,
                  setOnpressed: () {
                    Navigator.pop(context);
                    // Navigator.of(context).pop();

                    showActionSheet(
                      context: context,
                      url: widget.wallpaperImage[currentIndex].url,
                    );
                  },
                  shareOnpressed: () {},
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
