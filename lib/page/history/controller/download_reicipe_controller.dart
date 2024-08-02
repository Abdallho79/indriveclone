import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class DownloadReicipeController extends GetxController {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String fileUrl;
  late String filePath;
  late CancelToken cancelToken;
  bool isPermission = false;

  @override
  void onInit() {
    // fileUrl = Get.arguments["farepdf"];
    fileUrl = "${AppLink.reicpiePerson}/test1.pdf";
    fileName = path.basename(fileUrl);
    checkPermission();
    checkFileExists();
    super.onInit();
  }

  void openFile() {
    OpenFile.open(filePath);
  }

  Future<void> checkFileExists() async {
    var storePath = await getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    fileExists = fileExistCheck;
    update();
  }

  Future<void> checkPermission() async {
    var permission = await isStoragePermission();
    if (permission) {
      isPermission = true;
      update();
    }
  }

  Future<void> startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPath();
    filePath = '$storePath/$fileName';
    downloading = true;
    progress = 0;
    update();
    try {
      await Dio().download(fileUrl, filePath,
          onReceiveProgress: (count, total) {
        progress = (count / total);
        update();
      }, cancelToken: cancelToken);
      downloading = false;
      fileExists = true;
      update();
    } catch (e) {
      downloading = false;
      PrintString("Error", e);
      update();
    }
  }

  Future<String> getPath() async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final filePath = Directory("${tempDir!.path}/Downloads");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }

  Future<bool> isStoragePermission() async {
    var isStorage = await Permission.storage.status;
    if (!isStorage.isGranted) {
      await Permission.storage.request();
      if (!isStorage.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  @override
  void onClose() {
    if (downloading && !cancelToken.isCancelled) {
      cancelToken.cancel("Download cancelled");
    }
    super.onClose();
  }
}
