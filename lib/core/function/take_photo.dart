import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';


Future<File?> pickImageFromCamera() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    return File(pickedFile.path); // تحويل XFile إلى File
  } else {
    return null; // التعامل مع الحالة التي لم يتم فيها اختيار صورة
  }
}

Future<File?> pickFileFromStorage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image, // تحديد نوع الملفات المسموح بها
    allowedExtensions: [
      'jpg', 'jpeg', 'png', 'svg', 'bmp', 'gif', 'tiff', 'webp', 'heic',
      'ico', // امتدادات الصور الشائعة بالحروف الصغيرة
      'JPG', 'JPEG', 'PNG', 'SVG', 'BMP', 'GIF', 'TIFF', 'WEBP', 'HEIC',
      'ICO' // امتدادات الصور الشائعة بالحروف الكبيرة
    ], //
  );
  if (result != null && result.files.isNotEmpty) {
    // إذا تم اختيار ملف، قم بتحويله إلى File وإرجاعه
    File file = File(result.files.single.path!);
    return file;
  } else {
    // إذا لم يتم اختيار أي ملف، إرجاع null

    return null;
  }
}
