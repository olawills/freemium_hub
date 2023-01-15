import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/ui/styles/colors.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final VoidCallback onPressed;
  const SignUpButton({
    Key? key,
    required this.text,
    this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        fixedSize: const Size(300, 60),
        side: BorderSide(
          width: 2,
          color: DarkThemeColors.unSelectedIconColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          child ?? const SizedBox(),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
