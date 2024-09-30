import 'package:flutter/material.dart';
import 'package:instaflutter/screens/account.dart';
import 'package:instaflutter/styles/colors.dart';
import 'package:instaflutter/utils.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showAccountButton;

  const TopAppBar({super.key, this.showAccountButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Instaflutter"),
      titleTextStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "LobsterTwo"
      ),
      actions: topBarActions(context, showAccountButton),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

List<Widget> topBarActions(context, showAccountButton) {
  if(showAccountButton) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: TextButton(onPressed: () { goTo(context, const Account()); }, child: const Icon(Icons.person, size: 30, color: dark)),
      )
    ];
  } else {
    return [];
  }
}
