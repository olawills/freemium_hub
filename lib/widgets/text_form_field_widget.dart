import 'package:flutter/material.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class PassWordField extends StatelessWidget {
  final String labelText;
  const PassWordField({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: const Icon(Icons.key),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
