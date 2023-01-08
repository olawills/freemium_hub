import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:image_cropper/image_cropper.dart';

import 'show_modal_sheet_divider.dart';

enum SetWallpaperAs { HomeScreen, LockScreen, BothScreen }

Map _setAs = {
  SetWallpaperAs.HomeScreen: WallpaperManager.HOME_SCREEN,
  SetWallpaperAs.LockScreen: WallpaperManager.LOCK_SCREEN,
  SetWallpaperAs.BothScreen: WallpaperManager.BOTH_SCREEN,
};

Future<void> showActionSheet(
    {required BuildContext context, required String url}) async {
  final Color = Theme.of(context).scaffoldBackgroundColor;
  final height = MediaQuery.of(context).size.height * 1;
  final width = MediaQuery.of(context).size.width * 0.9;
  var showActionSheet = Container(
    height: 180,
    child: Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.home),
          title: Text(
            'Home Screen',
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {
            Navigator.of(context).pop(SetWallpaperAs.HomeScreen);
          },
        ),
        const ShowModalBottomSheetDivider(),
        ListTile(
          leading: const Icon(Icons.screen_lock_portrait),
          title: Text(
            'Lock Screen',
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {
            Navigator.of(context).pop(SetWallpaperAs.LockScreen);
          },
        ),
        const ShowModalBottomSheetDivider(),
        ListTile(
          leading: const Icon(Icons.phone_android),
          title: Text(
            'Both (Home & Lock Screens)',
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {
            Navigator.of(context).pop(SetWallpaperAs.BothScreen);
          },
        ),
      ],
    ),
  );

  SetWallpaperAs option = await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return showActionSheet;
    },
  );

  if (option != null) {
    var cachedImage = await DefaultCacheManager().getSingleFile(url);

    if (cachedImage != null) {
      var croppedImage = await ImageCropper().cropImage(
          sourcePath: cachedImage.path,
          aspectRatio: CropAspectRatio(
            ratioX: width,
            ratioY: height,
          ),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarWidgetColor: DarkThemeColors.unSelectedIconColor,
              toolbarColor: DarkThemeColors.darkThemeAppbar,
              hideBottomControls: true,
            ),
          ]);

      if (croppedImage != null) {
        var result = WallpaperManager.setWallpaperFromFile(
          croppedImage.path,
          _setAs[option],
        );
        if (result != null) {
          log(result.toString());
        }
      }
    }
  }
}
