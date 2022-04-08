import 'package:get/get.dart';
import 'package:provider_app/controllers/main_controller.dart';

import '../controllers/setting_controler.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<MainController>(MainController());
    Get.put<SettingController>(SettingController());
  }
}
