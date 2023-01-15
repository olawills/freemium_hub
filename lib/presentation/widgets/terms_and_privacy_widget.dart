import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/widgets/widget_extensions.dart';

class TermsAndPrivacyWidget extends StatelessWidget {
  const TermsAndPrivacyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'By signing up you agree to our',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 10..spacingH),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'Terms of use',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(width: 10..spacingW),
            const Text('and'),
            SizedBox(width: 10..spacingW),
            InkWell(
              onTap: () {},
              child: const Text(
                'privacy policy',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
