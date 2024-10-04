import 'package:chateo/modules/authentication/controllers/login_controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }
}