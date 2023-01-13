import 'package:flutter/material.dart';
import 'package:freemium_hub/styles/colors.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget(
      {Key? key, required this.onPressed, required this.downloadOnpressed})
      : super(key: key);

  final VoidCallback onPressed;
  final VoidCallback downloadOnpressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        bottom: 0,
        right: 0,
        child: Container(
          margin: const EdgeInsets.all(40),
          height: 150,
          width: 10,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: 90,
                    width: 80,
                    child: InkResponse(
                      onTap: () {},
                      child: CircleAvatar(
                        // radius: 20,
                        backgroundColor: DarkThemeColors.darkThemeAppbar,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 90,
                  width: 80,
                  child: InkResponse(
                    onTap: downloadOnpressed,
                    child: CircleAvatar(
                      // radius: 20,
                      backgroundColor: DarkThemeColors.darkThemeAppbar,
                      child: const Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 90,
                  width: 80,
                  child: InkResponse(
                    onTap: onPressed,
                    child: CircleAvatar(
                      backgroundColor: DarkThemeColors.darkThemeAppbar,
                      child: const Icon(
                        Icons.wallpaper,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
