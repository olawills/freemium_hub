import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/logic/models/wallpaper_models.dart';
import 'package:freemium_hub/presentation/screens/new_wallpaper_view.dart';
import 'package:freemium_hub/presentation/utils/enums.dart';
import 'package:freemium_hub/presentation/utils/routers.dart';

import '../../data/cubit_imports.dart';

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
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile ||
                state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
              return StaggeredGridView.countBuilder(
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
              );
            } else if (state is InternetDisconnected) {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text('No Connection..!!'),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
