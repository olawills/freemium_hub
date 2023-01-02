import 'package:flutter/material.dart';

class ContainerDivider extends StatelessWidget {
  final String text;
  const ContainerDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          height: 3,
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          text,
        ),
        Container(
          width: 120,
          height: 3,
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
