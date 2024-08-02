import 'dart:io';

import 'package:dio/dio.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future openFile({required String url, required String fileName}) async {
  File? file = await downloadFile(url, fileName);
  if (file == null) return;

  PrintString("File Path", file.path);

  OpenFile.open(file.path);
}

Future<File?> downloadFile(String url, String name) async {
  try {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");
    
    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            sendTimeout: const Duration(seconds: 0),
            receiveTimeout: const Duration(seconds: 0)));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    PrintString("Seccess", "Seccess");
    return file;
  } catch (e) {
    PrintString("error", e);
    return null;
  }
}
