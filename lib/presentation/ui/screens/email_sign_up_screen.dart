import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/widgets/new_account_header.dart';
import 'package:freemium_hub/presentation/widgets/text_form_field_widget.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const NewAccountHeader(text: 'Sign Up'),
            ),
            const TextFormFieldWidget(
              labelText: 'Email',
            ),
            const PassWordField(labelText: 'Password'),
          ],
        ),
      ),
    );
  }
}
