import 'diagnose.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();
XFile? image;
String? diagnosis;

Future<void> getImageFromGallery() async {
  image = await picker.pickImage(source: ImageSource.gallery);
}

Future<void> getImageFromCamera() async {
  image = await picker.pickImage(source: ImageSource.camera);
}
