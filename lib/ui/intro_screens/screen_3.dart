import 'package:flutter/material.dart';
import 'package:freemium_hub/widgets/intro_widget.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroPageWidget(
        text: 'Download and Save To Device Gallery',
      ),
    );
  }
}
