import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/models/wallpaper_models.dart';
import 'package:freemium_hub/ui/screens/new_wallpaper_view.dart';
import 'package:freemium_hub/utils/routers.dart';

class NewWallPaperScreen extends StatefulWidget {
  final List<WallpaperModels> wallpaperModels;
  const NewWallPaperScreen({
    Key? key,
    required this.wallpaperModels,
  }) : super(key: key);

  @override
  State<NewWallPaperScreen> createState() => _NewWallPaperScreenState();
}

class _NewWallPaperScreenState extends State<NewWallPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: widget.wallpaperModels.length,
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              onTap: () {
                nextPage(
                  context: context,
                  screen: NewWallpaperView(
                    wallpaperImage: widget.wallpaperModels,
                    currentIndex: index,
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ExtendedImage.network(
                  widget.wallpaperModels.elementAt(index).url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(1, index.isEven ? 1.3 : 1.3);
          },
        ),
      ),
    );
  }
}
