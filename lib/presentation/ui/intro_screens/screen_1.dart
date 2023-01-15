import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/widgets/intro_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroPageWidget(
        text: 'Welcome To The Best Wallpaper App',
      ),
    );
  }
}
