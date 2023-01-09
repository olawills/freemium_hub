
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/nav_pages/categories_wallpaper_screen.dart';
import 'package:freemium_hub/ui/nav_pages/new_wallpapers_sreen.dart';
import 'package:freemium_hub/widgets/custom_container_header.dart';

class WallpaperHome extends StatefulWidget {
  const WallpaperHome({Key? key}) : super(key: key);

  @override
  State<WallpaperHome> createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  bool selected = true;
  bool onLastPage = false;

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

  // final List<Widget> _screens = const [
  //   NewWallPaperScreen(),
  //   WallpaperCategories(),
  // ];
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
                        return PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (int index) {
                            setState(() {
                              pageIndex = index;
                            });
                          },
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return screenIndex(index, snapshot);
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                // } else {
                //   return Center(child: const CircularProgressIndicator());
                // }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget screenIndex(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    switch (index) {
      case 0:
        return NewWallPaperScreen(snapshot: snapshot);
      case 1:
        return WallpaperCategories(snapshot: snapshot);
      // case 2:
      //   return FavoritePage(snapshot: snapshot);
      //   break;
      default:
        return const CircularProgressIndicator();
    }
  }
}
