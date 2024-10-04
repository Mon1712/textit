import 'package:chateo/modules/authentication/controllers/splash_controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SplashController());
  }
}