import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaflutter/main.dart';
import 'package:instaflutter/utils.dart';

Future<void> singup(BuildContext context, String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    showSnackBar(context, 'Account created successfully!!');
    goTo(context, const MyApp());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> login(BuildContext context, String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
    );

    showSnackBar(context, 'Successfully logged in!!');
    goTo(context, const MyApp());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password provided for that user.');
    }
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();

  showSnackBar(context, 'Successfully logged out!!');
  goTo(context, const MyApp());
}

Future<void> editAccount(BuildContext context, String email, String password) async {
  User? user = getCurrentUser();
  await user?.verifyBeforeUpdateEmail(email);
  await user?.updatePassword(password);

  showSnackBar(context, 'Successfully edited!!');
  goTo(context, const MyApp());
}

Future<void> deleteAccount(BuildContext context) async {
  User? user = getCurrentUser();
  await user?.delete();

  showSnackBar(context, 'Successfully deleted!!');
  goTo(context, const MyApp());
}

bool isLoggedIn() {
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  } else {
    return false;
  }
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}
