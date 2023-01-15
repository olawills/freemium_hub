import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/ui/screens/home_page.dart';
import 'package:freemium_hub/presentation/utils/routers.dart';
import 'package:freemium_hub/presentation/widgets/auth_buttons.dart';
import 'package:freemium_hub/presentation/widgets/container_divider.dart';
import 'package:freemium_hub/presentation/widgets/widget_extensions.dart';
import 'package:page_transition/page_transition.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.4,
              child: const FlutterLogo(),
            ),
            SizedBox(height: 20..spacingH),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: const AuthScreen(),
                  ),
                );
              },
              child: Text(
                'Sign in to enjoy free wallpapers',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 25..spacingH),
            const ContainerDivider(
              text: 'or',
            ),
            SizedBox(height: 25..spacingH),
            GestureDetector(
              onTap: () {
                nextPageOnly(
                  context: context,
                  screen: const HomePage(),
                );
              },
              child: Text(
                'Sign in later',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
