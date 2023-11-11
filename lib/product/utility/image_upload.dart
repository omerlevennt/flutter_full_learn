import 'package:image_picker/image_picker.dart';

class ImageUploadManager {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> fecthFromLibrary() async {
    // Pick an image.
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
