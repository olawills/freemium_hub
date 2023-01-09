import 'package:flutter/material.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class IntroPageWidget extends StatelessWidget {
  final String text;
  const IntroPageWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              height: size.height * 0.2,
              width: size.width * 0.4,
              child: const FlutterLogo(),
            ),
          ),
          SizedBox(height: 10..spacingH),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
