import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/intro_screens/screen_1.dart';
import 'package:freemium_hub/presentation/intro_screens/screen_2.dart';
import 'package:freemium_hub/presentation/intro_screens/screen_3.dart';
import 'package:freemium_hub/presentation/intro_screens/screen_4.dart';
import 'package:freemium_hub/presentation/screens/home_page.dart';
import 'package:freemium_hub/presentation/utils/routers.dart';
import 'package:freemium_hub/presentation/widgets/app_buttons.dart';
import 'package:freemium_hub/presentation/widgets/widget_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = const [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: List.generate(
              _pages.length,
              (index) => _pages[index],
            ),
          ),
          Container(
            alignment: const Alignment(0.8, -0.85),
            child: onLastPage
                ? SizedBox(width: 30..spacingW)
                : InkWell(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      _pageController.jumpToPage(_pages.length);
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  onDotClicked: (index) {
                    _pageController.jumpToPage(index);
                  },
                ),
                onLastPage
                    ? FreemiumButtons(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          nextPageOnly(
                            context: context,
                            screen: const HomePage(),
                          );
                        },
                        size: const Size(80, 50),
                        child: const Icon(
                          Icons.check,
                        ),
                      )
                    : FreemiumButtons(
                        onPressed: () async {
                          // final prefs = await SharedPreferences.getInstance();
                          // prefs.setBool('showHome', true);
                          _pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        size: const Size(80, 50),
                        child: const Icon(
                          Icons.arrow_forward,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
