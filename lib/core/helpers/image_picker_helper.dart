import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../logging/app_logger.dart';

class ImagePickerHelper {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({
    required ImageSource source,
    int imageQuality = 50,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      AppLogger.error("Error picking image: $e");
    }
    return null;
  }
}
