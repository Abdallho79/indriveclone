import 'dart:convert'; // لاستعمال jsonDecode
import 'dart:io'; // لاستعمال File
import 'package:http/http.dart' as http; // لاستعمال http
import 'package:path/path.dart'; // لاستعمال basename
import 'package:dartz/dartz.dart'; // لاستعمال Either
import 'package:indriveclone/core/class/status_request.dart'; // لاستعمال StatusRequest
import 'package:indriveclone/core/function/check_internet.dart'; // لاستعمال checkInternet

class Curd {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    if (!await checkInternet()) {
      return left(StatusRequest.offlinefailure);
    }

    var response = await http.post(Uri.parse(link), body: data);
    if (!(response.statusCode == 200 || response.statusCode == 201)) {
      return left(StatusRequest.serverfailure);
    }

    Map responsebody = jsonDecode(response.body);
    return right(responsebody);
  }

  /// يقوم بإرسال طلب POST إلى [url] باستخدام [data] وملف [image] اختياري.
  /// يعيد [Either] يحتوي على [StatusRequest] أو [Map].
  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
    String url,
    Map data,
    File? image, [
    String? namerequest,
  ]) async {
    if (!await checkInternet()) {
      return left(StatusRequest.offlinefailure);
    }
    // التأكد من أن [namerequest] معين لـ "file" إذا لم يتم توفيره
    namerequest ??= "file";

    // تحويل النص الى رابط
    var uri = Uri.parse(url);

    // إنشاء طلب متعدد الأجزاء
    var request = http.MultipartRequest("POST", uri);

    // إضافة ملف الصورة إلى الطلب إذا تم توفيره
    if (image != null) {
      var length = await image.length(); // الحصول على طول الملف
      var stream = http.ByteStream(image.openRead()); // فتح تيار القراءة
      var multipartFile = http.MultipartFile(
        namerequest,
        stream,
        length,
        filename: basename(image.path), // اسم الملف الأصلي
      );
      request.files.add(multipartFile); // إضافة الملف إلى الطلب متعدد الأجزاء
    }

    // إضافة حقول البيانات إلى الطلب
    data.forEach((key, value) {
      request.fields[key] = value.toString(); // تحويل القيم إلى سلاسل نصية
    });

    try {
      // إرسال الطلب
      var myrequest = await request.send();

      // الحصول على جسم الاستجابة
      var response = await http.Response.fromStream(myrequest);

      // التحقق مما إذا كانت الاستجابة ناجحة (رمز الحالة 200 أو 201)
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody =
            jsonDecode(response.body); // تحويل جسم الاستجابة إلى Map
        return Right(responsebody); // إعادة الاستجابة كـ Right (ناجح)
      } else {
        return const Left(StatusRequest.serverfailure); // إعادة فشل الخادم
      }
    } catch (e) {
      // التعامل مع أي استثناءات قد تحدث أثناء عملية الطلب
      return const Left(StatusRequest.serverfailure); // إعادة فشل الخادم
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImages(
    String url,
    Map<String, String> data,
    List<File> images, [
    String namerequest = "file",
  ]) async {
    if (!await checkInternet()) {
      return const Left(StatusRequest.offlinefailure);
    }
    var uri = Uri.parse(url);

    var request = http.MultipartRequest("POST", uri);

    for (var i = 0; i < images.length; i++) {
      var length = await images[i].length();
      var stream = http.ByteStream(images[i].openRead());
      var multipartFile = http.MultipartFile(
        namerequest + i.toString(),
        stream,
        length,
        filename: basename(images[i].path),
      );
      request.files.add(multipartFile);
      print("Added file: ${images[i].path}");
    }

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    try {
      print("Sending request...");
      var myrequest = await request.send();

      var response = await http.Response.fromStream(myrequest);
      print("Response received with status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Parsing response body...");
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverfailure);
    }
  }
}
