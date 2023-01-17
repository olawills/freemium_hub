import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/widgets/intro_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroPageWidget(
        text: 'Choose the Best Wallpaper',
      ),
    );
  }
}
