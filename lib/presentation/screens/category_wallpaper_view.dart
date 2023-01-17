// ignore_for_file: use_build_context_synchronously

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemium_hub/logic/models/wallpaper_models.dart';
import 'package:freemium_hub/presentation/utils/permission_dialog.dart';
import 'package:freemium_hub/presentation/widgets/bottom_widget.dart';
import 'package:freemium_hub/presentation/widgets/show_modal_sheet.dart';
import 'package:freemium_hub/presentation/widgets/wallpaper_dialog.dart';

import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class CategoryWallpaperView extends StatefulWidget {
  final List<WallpaperModels> image;
  final int currentIndex;
  const CategoryWallpaperView({
    Key? key,
    required this.image,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CategoryWallpaperView> createState() => _CategoryWallpaperViewState();
}

class _CategoryWallpaperViewState extends State<CategoryWallpaperView>
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.image.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: _pageController,
            itemBuilder: (BuildContext context, index) {
              return ExtendedImage.network(
                widget.image[index].url,
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
                    widget.image[currentIndex].url,
                    destination: AndroidDestinationType.directoryPictures
                      ..inExternalFilesDir(),
                  );
                  final snackBar = SnackBar(
                    content: Text(
                      'Download Completed..',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
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
                  debugPrint(error.toString());
                }
              } else {
                alertDialog(
                  context: context,
                  onPressed: () {
                    openAppSettings();
                  },
                );
              }
            },
            onPressed: () async {
              await setWallpaperDialogBox(
                context,
                setOnpressed: () {
                  Navigator.pop(context);

                  showActionSheet(
                    context: context,
                    url: widget.image[currentIndex].url,
                  );
                },
                shareOnpressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
