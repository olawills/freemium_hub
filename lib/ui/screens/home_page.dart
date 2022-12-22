import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/nav_pages/app_settings_page.dart';
import 'package:freemium_hub/ui/nav_pages/downloads_page.dart';
import 'package:freemium_hub/ui/nav_pages/home.dart';
import 'package:freemium_hub/ui/nav_pages/login_signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> _pages = [
    {'icon': Icons.bookmark, 'title': 'Home'},
    {'icon': Icons.download, 'title': 'Downloads'},
    {'icon': Icons.person, 'title': 'Get Access'},
    {'icon': Icons.settings, 'title': 'Settings'},
  ];
  final List<Widget> screens = const [
    WallpaperHome(),
    WallpaperDownloadsPage(),
    AuthenticationPage(),
    WallpaperSettings(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
          height: 80,
          margin: const EdgeInsets.all(10),
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
