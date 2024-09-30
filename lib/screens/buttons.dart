import 'package:flutter/material.dart';
import 'package:instaflutter/screens/login.dart';
import 'package:instaflutter/screens/singup.dart';
import 'package:instaflutter/widgets/action_button.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
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
            ]
          ),
        ),
      ),
    );
  }
}
