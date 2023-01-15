import 'package:flutter/material.dart';

void nextPage({Widget? screen, BuildContext? context}) {
  Navigator.push(context!, MaterialPageRoute(builder: (_) => screen!));
}

void nextPageOnly({Widget? screen, BuildContext? context}) {
  Navigator.pushAndRemoveUntil(
      context!, MaterialPageRoute(builder: (_) => screen!), (route) => false);
}
