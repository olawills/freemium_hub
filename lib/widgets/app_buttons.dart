import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';

class FreemiumButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final Size size;
  final Widget child;

  const FreemiumButtons({
    Key? key,
    required this.onPressed,
    required this.size,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: DarkThemeColors.bodyColor,
        shape: const CircleBorder(),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        fixedSize: size,
      ),
      child: child,
    );
  }
}
