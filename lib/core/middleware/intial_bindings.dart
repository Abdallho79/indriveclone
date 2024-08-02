import 'package:get/get.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import '../class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Curd());
    Get.lazyPut(() => MyDrawerController(), fenix: true);
  }
}
