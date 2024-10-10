import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaflutter/styles/colors.dart';
import 'package:instaflutter/utils.dart';
import 'package:instaflutter/widgets/action_button.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20, top: 20),
              child: ActionButton(label: "Copy photo link", action: () => copyPhotoUrl(photo, context))
            ),
          ],
        ),
      ),
    );
  }

  void copyPhotoUrl(url, context) {
    Clipboard.setData(ClipboardData(text: photo));
    showSnackBar(context, "Photo url copied to clipboard!");
  }
}
