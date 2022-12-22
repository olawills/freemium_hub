import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class WallpaperHome extends StatefulWidget {
  const WallpaperHome({Key? key}) : super(key: key);

  @override
  State<WallpaperHome> createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> {
  final bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                splashColor: Colors.white54,
                child: Container(
                  height: 50,
                  width: 150,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'ALL',
                      style: TextStyle(
                        color: selected
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 50,
                  width: 150,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: const Text('CATEGORIES'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
