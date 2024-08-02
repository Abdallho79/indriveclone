import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/page/history/controller/download_reicipe_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class ReicipeView extends StatelessWidget {
  ReicipeView({super.key});

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DownloadReicipeController controller = Get.put(DownloadReicipeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reicipe'),
        actions: [buildActionButton(controller)],
      ),
      body: SfPdfViewer.network(
        controller.fileUrl,
        key: pdfViewerKey,
      ),
    );
  }
}

GetBuilder buildActionButton(DownloadReicipeController controller) {
  return GetBuilder<DownloadReicipeController>(builder: (controller) {
    return IconButton(
      onPressed: () {
        if (controller.fileExists && !controller.downloading) {
          controller.openFile();
        } else {
          controller.startDownload();
        }
        PrintString("Path", controller.filePath);
      },
      icon: controller.fileExists
          ? const Icon(
              Icons.save,
              color: Colors.green,
            )
          : controller.downloading
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: controller.progress,
                      strokeWidth: 3,
                      backgroundColor: Colors.grey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    Text(
                      (controller.progress * 100).toStringAsFixed(2),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                )
              : const Icon(Icons.download),
    );
  });
}
