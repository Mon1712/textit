import 'package:chateo/modules/authentication/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SignUpController());
  }
}