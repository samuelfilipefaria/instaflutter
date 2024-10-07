import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instaflutter/main.dart';
import 'package:instaflutter/services/firebase_auth.dart';
import 'package:instaflutter/utils.dart';
import 'package:instaflutter/widgets/post.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

void createPost(BuildContext context, String caption, String photo) {
  // Create a new user with a first and last name
  final post = <String, dynamic>{
    "caption": caption,
    "photo": photo,
    "user": getCurrentUser()?.email.toString()
  };

  // Add a new document with a generated ID
  db.collection("posts").add(post).then((DocumentReference doc) {
    showSnackBar(context, 'Successfully deleted!!');
    goTo(context, const MyApp());
  });
}
