import 'package:flutter/material.dart';
import 'package:instaflutter/styles/colors.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback action;

  const ActionButton({super.key, required this.label, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(primary),
        foregroundColor: WidgetStateProperty.all(light),
        shape: WidgetStateProperty.all(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10)
            )
          )
        )
      ),
      child: Text(label),
    );
  }
}
