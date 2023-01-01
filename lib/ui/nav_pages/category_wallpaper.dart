import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:freemium_hub/ui/screens/wallpaper_view.dart';
import 'package:freemium_hub/utils/routers.dart';

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
          style: Theme.of(context).textTheme.headline6,
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
          if (snapshot.hasData) {
            var categoryDocuments = snapshot.data?.docs
                .where((document) => (document.get('tag') == widget.category));
            return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: categoryDocuments?.length,
              itemBuilder: (BuildContext context, int index) {
                // if (snapshot.hasData) {
                return InkResponse(
                  onTap: () {
                    nextPage(
                        context: context,
                        screen: WallpaperView(
                          snapshot: snapshot.data!.docs.elementAt(index),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff000000),
                          Color(0xff000000),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: ExtendedNetworkImageProvider(
                          categoryDocuments?.elementAt(index).get('image_url'),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
                // } else {
                //   return Center(
                //     child: CircularProgressIndicator(
                //       color: DarkThemeColors.selectedIconColor,
                //     ),
                //   );
                // }
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.3 : 1.3);
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
}
