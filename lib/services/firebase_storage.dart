import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

final storage = FirebaseStorage.instance;

Future<String> uploadPostImage() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowMultiple: false, allowedExtensions: ['png']);

  if (result != null && result.files.isNotEmpty) {
    final fileBytes = result.files.first.bytes;
    String filePath = 'posts_images/${DateTime.now()}.png';
    await storage.ref(filePath).putData(fileBytes!, SettableMetadata(contentType: 'image/png'));
    String downloadUrl = await storage.ref(filePath).getDownloadURL();

    return downloadUrl;
  } else {
    return "";
  }
}
