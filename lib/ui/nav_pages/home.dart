import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/screens/categories_wallpaper_screen.dart';
import 'package:freemium_hub/ui/screens/new_wallpapers_sreen.dart';

class WallpaperHome extends StatefulWidget {
  const WallpaperHome({Key? key}) : super(key: key);

  @override
  State<WallpaperHome> createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  final List<Widget> _screens = const [
    NewWallPaperScreen(),
    WallpaperCategories(),
  ];
  bool selected = true;
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
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
                          'NEW',
                          style: TextStyle(
                            color: pageIndex == 0
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedItemColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
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
                        child: Text(
                          'CATEGORIES',
                          style: TextStyle(
                            color: pageIndex == 1
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedItemColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  // physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  children: _screens,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
