import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/nav_pages/favorite_page.dart';
import 'package:freemium_hub/ui/nav_pages/downloads_page.dart';
import 'package:freemium_hub/ui/nav_pages/home.dart';
import 'package:freemium_hub/ui/nav_pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> _pages = [
    {'icon': Icons.bookmark, 'title': 'Home'},
    {'icon': Icons.favorite, 'title': 'Favorites'},
    {'icon': Icons.download, 'title': 'Downloads'},
    {'icon': Icons.settings, 'title': 'Settings'},
  ];
  final List<Widget> screens = const [
    WallpaperHome(),
    FavoritePage(),
    WallpaperDownloadsPage(),
    SettingsPage(),
  ];
  int currentIndex = 0;
  // final PageController _pageController = PageController();

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      // body: PageView.builder(
      //   controller: _pageController,
      //   physics: const BouncingScrollPhysics(),
      //   onPageChanged: (int index) {
      //     setState(() {
      //     currentIndex = index;
      //     });
      //   },
      //   itemCount: screens.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return screens[index];
      //   },
      // ),
      bottomNavigationBar: Container(
          height: 80,
          child: BottomNavigationBar(
            iconSize: 30,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(
              _pages.length,
              (index) {
                final data = _pages[index];
                return BottomNavigationBarItem(
                  icon: Icon(
                    data['icon'],
                  ),
                  label: data['title'],
                );
              },
            ),
          )),
    );
  }
}
