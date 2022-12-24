import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freemium_hub/widgets/container_divider.dart';
import 'package:freemium_hub/widgets/sign_up_buttons.dart';
import 'package:freemium_hub/widgets/terms_and_privacy_widget.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    'New Account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20..spacingH),
            Text(
              'Create an account to get updated on the latest wallpapers',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30..spacingH),
            SignUpButton(
              text: 'Sign Up with Facebook',
              child: Icon(
                FontAwesomeIcons.facebook,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
            ),
            SizedBox(height: 20..spacingH),
            const SignUpButton(
              text: 'Sign Up with Google',
              child: Icon(
                FontAwesomeIcons.google,
                size: 30,
              ),
            ),
            SizedBox(height: 20..spacingH),
            const ContainerDivider(text: 'or'),
            SizedBox(height: 20..spacingH),
            const SignUpButton(
              text: 'Sign Up with Email',
            ),
            SizedBox(height: 20..spacingH),
            const TermsAndPrivacyWidget()
          ],
        ),
      ),
    );
  }
}
