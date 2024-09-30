import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instaflutter/services/firebase_auth.dart';
import 'package:instaflutter/screens/buttons.dart';
import 'package:instaflutter/screens/feed.dart';
import 'package:instaflutter/styles/colors.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Template",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(backgroundColor: light, centerTitle: true)
      ),
      home: isLoggedIn() ? const Feed() : const Buttons(),
    );
  }
}
