import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/screens/favorite_page.dart';
import 'package:freemium_hub/ui/screens/downloads_page.dart';
import 'package:freemium_hub/ui/nav_pages/home.dart';
import 'package:freemium_hub/ui/screens/settings_page.dart';

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
  final PageController _pageController = PageController(initialPage: 0);
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: screens.length,
        itemBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: BottomNavigationBar(
            iconSize: 30,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                _pageController.animateToPage(
                  currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                );
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
