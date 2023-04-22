import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();

Future<XFile?> getImageFromGallery() async {
  return await picker.pickImage(source: ImageSource.gallery);
}

Future<XFile?> getImageFromCamera() async {
  return await picker.pickImage(source: ImageSource.camera);
}
