import 'package:flutter/material.dart';

class NewWallPaperScreen extends StatefulWidget {
  const NewWallPaperScreen({Key? key}) : super(key: key);

  @override
  State<NewWallPaperScreen> createState() => _NewWallPaperScreenState();
}

class _NewWallPaperScreenState extends State<NewWallPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Wallpapers!....',
        ),
      ),
    );
  }
}
