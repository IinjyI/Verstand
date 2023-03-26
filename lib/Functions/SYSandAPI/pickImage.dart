import 'diagnose.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();
XFile? image;
String diagnosis = " ";

Future<void> sendImageFromGallery() async {
  image = await picker.pickImage(source: ImageSource.gallery);
  diagnosis = await diagnose(image);
}

Future<void> sendImageFromCamera() async {
  image = await picker.pickImage(source: ImageSource.camera);
  diagnosis = await diagnose(image);
}
