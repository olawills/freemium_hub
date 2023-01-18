import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/logic/models/wallpaper_models.dart';
import 'package:freemium_hub/presentation/screens/category_wallpaper_view.dart';
import 'package:freemium_hub/presentation/styles/colors.dart';
import 'package:freemium_hub/presentation/utils/routers.dart';

class CategoryWallpapers extends StatefulWidget {
  final String category;
  const CategoryWallpapers({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryWallpapers> createState() => _CategoryWallpapersState();
}

class _CategoryWallpapersState extends State<CategoryWallpapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: Theme.of(context).textTheme.headline4,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.active) {
            var wallpapers = _getWallpapersCategory(snapshot.data?.docs);
            return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: wallpapers.length,
              itemBuilder: (BuildContext context, int index) {
                // if (snapshot.hasData) {
                return InkResponse(
                  onTap: () {
                    nextPage(
                      context: context,
                      screen: CategoryWallpaperView(
                        image: wallpapers,
                        currentIndex: index,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: ExtendedNetworkImageProvider(
                          wallpapers.elementAt(index).url,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.4 : 1.4);
              },
            );
          
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: DarkThemeColors.selectedIconColor,
              ),
            );
          }
        },
      ),
    );
  }

  List<WallpaperModels> _getWallpapersCategory(
      List<QueryDocumentSnapshot<Object?>>? documents) {
    final List<WallpaperModels> list = [];

    documents?.forEach((document) {
      var wallpaper = WallpaperModels.fromDocumentSnapshot(document);

      if (wallpaper.category == widget.category) {
        list.add(wallpaper);
      }
    });

    return list;
  }
}
