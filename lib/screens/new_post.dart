import 'package:flutter/material.dart';
import 'package:instaflutter/services/firebase_storage.dart';
import 'package:instaflutter/styles/colors.dart';
import 'package:instaflutter/widgets/action_button.dart';
import 'package:instaflutter/widgets/text_input.dart';
import 'package:instaflutter/widgets/top_app_bar.dart';
import 'package:instaflutter/services/firebase_database.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final TextEditingController _imageLinkController = TextEditingController(text: "no_image");
  final TextEditingController _captionController = TextEditingController();

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
              const Text("New post", style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ActionButton(
                  label: "Upload an image",
                  action: () async {
                    _imageLinkController.text = await uploadPostImage();
                    setState(() {});
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextInput(label: "Caption", controller: _captionController,)
              ),
              Builder(
              builder: (context) {
                if(_imageLinkController.text != "no_image") {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ActionButton(
                      label: "Post", action: () => { createPost(context, _captionController.text, _imageLinkController.text) }
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Upload an image please..."),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
