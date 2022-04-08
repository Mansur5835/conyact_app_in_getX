import 'package:get/get.dart';
import 'package:provider_app/controllers/main_controller.dart';
import 'package:provider_app/controllers/pay_page.dart';
import 'package:provider_app/controllers/setting_controler.dart';

class DI {
  static Future<void> init() async {
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<PayController>(() => PayController(), fenix: true);
  }
}
