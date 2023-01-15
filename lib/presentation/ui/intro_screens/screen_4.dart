import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/widgets/intro_widget.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroPageWidget(
        text:
            'Clear App Chache, Dark Theme Support Beautiful UI \nand many more',
      ),
    );
  }
}
