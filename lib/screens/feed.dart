import 'package:flutter/material.dart';
import 'package:instaflutter/main.dart';
import 'package:instaflutter/services/firebase_auth.dart';
import 'package:instaflutter/utils.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(showAccountButton: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout(context);
        },
        child: const Icon(Icons.logout)
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text("Feed aqui")
            ]
          ),
        ),
      ),
    );
  }
}
