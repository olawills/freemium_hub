import 'package:flutter/material.dart';
import 'package:freemium_hub/ui/intro_screens/intro_screen.dart';
import 'package:freemium_hub/utils/routers.dart';

import 'ui/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  final bool showHome;
  const SplashScreen({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    widget.showHome == true
        ? Future.delayed(
            const Duration(seconds: 2),
            () {
              nextPageOnly(
                context: context,
                screen: const HomePage(),
              );
            },
          )
        : Future.delayed(const Duration(seconds: 2), () {
            nextPageOnly(context: context, screen: const IntroScreen());
          });

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * 0.5,
          width: size.width * 0.5,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
