import 'package:flutter/material.dart';
Future<void> alertDialog(
      {required BuildContext context, required VoidCallback onPressed}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Need Access to Storge'),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: const Text('Open Settings'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
  }