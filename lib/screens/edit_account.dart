import 'package:flutter/material.dart';
import 'package:instaflutter/widgets/action_button.dart';
import 'package:instaflutter/widgets/text_input.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';
import 'package:instaflutter/services/firebase_auth.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final TextEditingController _emailController = TextEditingController(text: getCurrentUser()?.email.toString());
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Column(
            children: [
              const Text("Edit account", style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextInput(label: "E-mail", autofocusEnabled: true, controller: _emailController)
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextInput(label: "Password", hideText: true, controller: _passwordController)
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ActionButton(
                  label: "Edit account", action: () => {
                    editAccount(context, _emailController.text, _passwordController.text)
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
