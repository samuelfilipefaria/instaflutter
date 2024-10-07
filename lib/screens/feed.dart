import 'package:flutter/material.dart';
import 'package:instaflutter/screens/new_post.dart';
import 'package:instaflutter/services/firebase_database.dart';
import 'package:instaflutter/styles/colors.dart';
import 'package:instaflutter/utils.dart';
import 'package:instaflutter/widgets/post.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // perform post-frame initialization here
      getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(showAccountButton: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(80.0),
        child: FloatingActionButton(
          backgroundColor: primary,
          foregroundColor: light,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          onPressed: () {
            goTo(context, const NewPost());
          },
          child: const Icon(Icons.add)
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: posts
          ),
        ),
      ),
    );
  }

  void getAllPosts() {
    db.collection("posts").get().then((records) {
      for(var postData in records.docs) {
        posts.add(
          Post(user: postData["user"], photo: postData["photo"], caption: postData["caption"])
        );

        setState(() {});
      }
    });
  }
}