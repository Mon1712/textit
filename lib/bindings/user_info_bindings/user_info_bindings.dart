import 'package:chateo/modules/features/controllers/user_info_controller/user_info_controller.dart';
import 'package:get/get.dart';

class UserInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>UserInfoController());
  }
}