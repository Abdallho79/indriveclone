// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';

// class FileUploader extends StatefulWidget {
//   @override
//   _FileUploaderState createState() => _FileUploaderState();
// }

// class _FileUploaderState extends State<FileUploader> {
//   List<File> _files = [];

//   Future<void> pickFiles() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.any,
//     );

//     if (result != null) {
//       setState(() {
//         _files = result.paths.map((path) => File(path!)).toList();
//       });
//     }
//   }

//   Future<void> uploadFiles(String url) async {
//     var uri = Uri.parse(url);
//     var request = http.MultipartRequest("POST", uri);

//     for (File file in _files) {
//       var stream = http.ByteStream(file.openRead());
//       var length = await file.length();
//       var multipartFile = http.MultipartFile(
//         'files', // Adjust this key to what your backend expects
//         stream,
//         length,
//         filename: basename(file.path),
//       );

//       request.files.add(multipartFile);
//     }

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print('Files uploaded successfully');
//     } else {
//       print('Failed to upload files. Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Uploader'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: pickFiles,
//               child: Text('Pick Files'),
//             ),
//             ElevatedButton(
//               onPressed: () => uploadFiles('https://example.com/upload'),
//               child: Text('Upload Files'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: FileUploader(),
//   ));
// }
