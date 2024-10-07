import 'package:flutter/material.dart';
import 'package:instaflutter/styles/colors.dart';

class Post extends StatelessWidget {
  final String user;
  final String photo;
  final String caption;

  const Post({
    super.key,
    required this.user,
    required this.photo,
    required this.caption
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: dark, style: BorderStyle.solid, width: 1)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20, top: 20),
            child: SizedBox(width: 350, child: Row(children: [const  Icon(Icons.person), Text(user)]))
          ),
          Image.network(
            width: 350,
            height: 350,
            photo
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20, top: 20),
            child: SizedBox(width: 350, child: Text(caption))
          ),
        ],
      ),
    );
  }
}
