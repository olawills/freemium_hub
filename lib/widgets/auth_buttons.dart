import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freemium_hub/ui/screens/email_sign_in_screen.dart';
import 'package:freemium_hub/ui/screens/email_sign_up_screen.dart';
import 'package:freemium_hub/widgets/container_divider.dart';
import 'package:freemium_hub/widgets/new_account_header.dart';
import 'package:freemium_hub/widgets/sign_up_buttons.dart';
import 'package:freemium_hub/widgets/terms_and_privacy_widget.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';
import 'package:page_transition/page_transition.dart';

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
              child: const NewAccountHeader(text: 'New Account'),
            ),
            SizedBox(height: 20..spacingH),
            Text(
              'Create an account to get updated on the latest wallpapers',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30..spacingH),
            SignUpButton(
              onPressed: () {},
              text: 'Sign Up with Facebook',
              child: Icon(
                FontAwesomeIcons.facebook,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
            ),
            SizedBox(height: 20..spacingH),
            SignUpButton(
              onPressed: () {},
              text: 'Sign Up with Google',
              child: const Icon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 30,
              ),
            ),
            SizedBox(height: 20..spacingH),
            const ContainerDivider(text: 'or'),
            SizedBox(height: 20..spacingH),
            SignUpButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: const EmailSignUpScreen(),
                  ),
                );
              },
              text: 'Sign Up with Email',
            ),
            SizedBox(height: 20..spacingH),
            const TermsAndPrivacyWidget(),
            SizedBox(height: 20..spacingH),
            const Text(
              'Already have an account?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20..spacingH),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: const EmailSignInScreen(),
                  ),
                );
              },
              child: Text(
                'SIGN IN',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
