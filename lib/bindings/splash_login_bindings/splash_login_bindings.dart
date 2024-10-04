import 'package:chateo/modules/authentication/controllers/splash_login_controller/splash_login_controller.dart';
import 'package:get/get.dart';

class SplashLoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SplashLoginController());
  }
}