import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/localization/local_controller.dart';
import 'package:indriveclone/core/localization/translitions.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/core/middleware/intial_bindings.dart';
import 'package:indriveclone/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return GetMaterialApp(
      initialBinding: InitialBindings(),
      theme: controller.apptheme,
      locale: controller.language,
      translations: MyTranslitions(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
    );
  }
}




// import 'package:indriveclone/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );