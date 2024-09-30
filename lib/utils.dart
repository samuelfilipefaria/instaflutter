import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void goTo(BuildContext context, Widget route) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}
