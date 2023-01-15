import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/ui/styles/colors.dart';

class ShowModalBottomSheetDivider extends StatelessWidget {
  const ShowModalBottomSheetDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // flex: 5,
          child: Container(
            height: 2,
            width: 2,
            decoration: BoxDecoration(
              color: DarkThemeColors.selectedIconColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
