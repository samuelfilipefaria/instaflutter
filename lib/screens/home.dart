import 'package:flutter/material.dart';
import 'package:instaflutter/screens/login.dart';
import 'package:instaflutter/screens/singup.dart';
import 'package:instaflutter/services/firebase_auth.dart';
import 'package:instaflutter/widgets/action_button.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: isLoggedIn() ? feed() : buttons(context)
          ),
        ),
      ),
    );
  }
}

List<Widget> buttons(context) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionButton(label: "Log in", action: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login())
        )
      }),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionButton(label: "Sing up", action: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Singup())
        )
      }),
    )
  ];
}

List<Widget> feed() {
  return [
    Text("Feed aqui"),
    FloatingActionButton(onPressed: () { logout(); }, child: const Icon(Icons.logout), )
  ];
}
