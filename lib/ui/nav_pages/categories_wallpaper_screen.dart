import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/models/wallpaper_models.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:freemium_hub/ui/nav_pages/category_wallpaper.dart';
import 'package:freemium_hub/utils/routers.dart';

class WallpaperCategories extends StatefulWidget {
  final List<WallpaperModels> wallpaperModels;
  const WallpaperCategories({
    Key? key,
    required this.wallpaperModels,
  }) : super(key: key);

  @override
  State<WallpaperCategories> createState() => _WallpaperCategoriesState();
}

class _WallpaperCategoriesState extends State<WallpaperCategories> {
  final List<String> categories = [];
  final List<String> categoryImages = [];

  @override
  void initState() {
    super.initState();

    for (var wallpapers in widget.wallpaperModels) {
      var category = wallpapers.category;

      if (!categories.contains(category)) {
        categories.add(category);
        categoryImages.add(wallpapers.url);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.wallpaperModels.isNotEmpty) {
            return InkResponse(
              onTap: () {
                nextPage(
                  context: context,
                  screen: CategoryWallpapers(
                    category: categories.elementAt(index),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: ExtendedNetworkImageProvider(
                      categoryImages.elementAt(index),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  categories.elementAt(index),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            );
          }
          // else if (widget.snapshot.connectionState == ConnectionState.none) {
          //   return const Center(
          //     child: Text(
          //       'Check your network and try again later...',
          //     ),
          //   );
          // }
          else {
            return Center(
              child: CircularProgressIndicator(
                color: DarkThemeColors.selectedIconColor,
              ),
            );
          }
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(1, index.isEven ? 1.3 : 1.3);
        },
      )),
    );
  }
}
