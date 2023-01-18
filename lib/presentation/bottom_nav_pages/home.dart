import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/logic/models/wallpaper_models.dart';
import 'package:freemium_hub/presentation/bottom_nav_pages/new_wallpapers_screen.dart';
import 'package:freemium_hub/presentation/bottom_nav_pages/wallpapers_category_screen.dart';
import 'package:freemium_hub/presentation/screens/favorite_page.dart';
import 'package:freemium_hub/presentation/widgets/custom_container_header.dart';

class WallpaperHome extends StatefulWidget {
  const WallpaperHome({Key? key}) : super(key: key);

  @override
  State<WallpaperHome> createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> {
  late PageController _pageController;
  int pageIndex = 0;
  bool selected = true;
  bool onLastPage = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // List<String> foldername = [
  //   'Abstract',
  //   'Animals',
  //   'Animes',
  //   'Marvel',
  //   'Fantasy',
  //   'Quotes',
  //   'New',

  //   // 'Architecture',
  //   // 'Basketball',
  //   // 'Bikes',
  //   // 'Cars',
  //   // 'Dark',
  //   // 'Fantasy',
  //   // 'Flowers',
  //   // 'Graphics CGI',
  //   // 'New',
  //   // 'Sport',
  // ];

  // void createWallpaperCollection(List<String> folderName) async {
  //   final storage = FirebaseStorage.instance;
  //   // Check the flag in Cloud Firestore
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('flags')
  //       .doc('images_uploaded')
  //       .get();
  //   // bool imagesUploaded = snapshot.exists ? snapshot.data()!['value'] : false;
  //   log(snapshot.data().toString());

  //   // if (!imagesUploaded) {
  //   for (int i = 0; i < foldername.length; i++) {
  //     String folderName = foldername[i];
  //     String path = '$folderName/';

  //     var list = await storage.ref().child(path).listAll();

  //     // Get the download URLs for the images
  //     List<String> imageUrls = [];
  //     for (var item in list.items) {
  //       String downloadUrl = await item.getDownloadURL();
  //       imageUrls.add(downloadUrl);
  //     }
  //     const uuid = Uuid();
  //     for (int j = 0; j < imageUrls.length; j++) {
  //       String imageUrl = imageUrls[j];
  //       String documentId = uuid.v4();

  //       await FirebaseFirestore.instance
  //           .collection('wallpapers')
  //           .doc(documentId)
  //           .set({
  //         'image_url': imageUrl,
  //         'tag': folderName,
  //       });
  //     }
  //     // }
  //     await FirebaseFirestore.instance
  //         .collection('flags')
  //         .doc('images_uploaded')
  //         .set({
  //       'value': true,
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   createWallpaperCollection(foldername);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ContainerHeader(
                  pageController: _pageController, pageIndex: pageIndex),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('wallpapers')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        final List<WallpaperModels> wallpaperModels = [];
                        for (var documentSnapshot in snapshot.data!.docs) {
                          wallpaperModels.add(
                              WallpaperModels.fromDocumentSnapshot(
                                  documentSnapshot));
                        }
                        return PageView.builder(
                          controller: _pageController,
                          // physics: const AlwaysScrollableScrollPhysics(),
                          onPageChanged: (int index) {
                            setState(() {
                              pageIndex = index;
                            });
                          },
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return screenIndex(index, wallpaperModels);
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget screenIndex(int index, List<WallpaperModels> wallpaperModels) {
    switch (index) {
      case 0:
        return NewWallPaperScreen(wallpaperModels: wallpaperModels);
      case 1:
        return WallpaperCategories(wallpaperModels: wallpaperModels);

      default:
        return const CircularProgressIndicator();
    }
  }
}
