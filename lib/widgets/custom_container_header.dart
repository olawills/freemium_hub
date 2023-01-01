import 'package:flutter/material.dart';

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({
    Key? key,
    required PageController pageController,
    required this.pageIndex,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
