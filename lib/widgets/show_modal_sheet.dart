import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:image_cropper/image_cropper.dart';

import 'show_modal_sheet_divider.dart';

enum SetWallpaperAs { homeScreen, lockScreen, bothScreen }

Map _setAs = {
  SetWallpaperAs.homeScreen: WallpaperManager.HOME_SCREEN,
  SetWallpaperAs.lockScreen: WallpaperManager.LOCK_SCREEN,
  SetWallpaperAs.bothScreen: WallpaperManager.BOTH_SCREEN,
};

Future<void> showActionSheet(
    {required BuildContext context, required String url}) async {
  // final Color = Theme.of(context).scaffoldBackgroundColor;
  final height = MediaQuery.of(context).size.height * 1;
  final width = MediaQuery.of(context).size.width * 0.98;
  var showActionSheet = SizedBox(
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
            Navigator.of(context).pop(SetWallpaperAs.homeScreen);
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
            // Navigator.of(context).pop();
            Navigator.of(context).pop(SetWallpaperAs.lockScreen);
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
            Navigator.of(context).pop(SetWallpaperAs.bothScreen);
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

  var cachedImage = await DefaultCacheManager().getSingleFile(url);

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
    debugPrint(result.toString());
  } else {
    log(croppedImage.toString());
  }
}
