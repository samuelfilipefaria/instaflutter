import 'package:flutter/material.dart';
import 'package:instaflutter/screens/edit_account.dart';
import 'package:instaflutter/widgets/action_button.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';
import 'package:instaflutter/services/firebase_auth.dart';
import 'package:instaflutter/utils.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
              Text(getCurrentUser()!.email.toString(), style: const TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ActionButton(
                  label: "Log out", action: () => {
                    logout(context)
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ActionButton(
                  label: "Edit data", action: () => {
                    goTo(context, const EditAccount())
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ActionButton(
                  label: "Delete account", action: () => {
                    deleteAccount(context)
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
