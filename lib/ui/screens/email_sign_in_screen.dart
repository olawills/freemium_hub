import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freemium_hub/widgets/container_divider.dart';
import 'package:freemium_hub/widgets/new_account_header.dart';
import 'package:freemium_hub/widgets/sign_up_buttons.dart';
import 'package:freemium_hub/widgets/text_form_field_widget.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const NewAccountHeader(
                  text: 'Sign in',
                ),
              ),
              SizedBox(height: 20..spacingH),
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
              SizedBox(height: size.height * 0.03),
              const ContainerDivider(text: 'or'),
              SizedBox(height: size.height * 0.02),
              const TextFormFieldWidget(
                labelText: 'Email',
              ),
              const PassWordField(
                labelText: 'Password',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Forgot password?'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('SIGN IN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
