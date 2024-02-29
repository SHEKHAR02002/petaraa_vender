import 'package:image_picker/image_picker.dart';

Future<dynamic> imagePicker({
  required ImageSource source,
}) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    return pickedFile.path;
  }
}
