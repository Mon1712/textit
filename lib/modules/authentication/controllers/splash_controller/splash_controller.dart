import 'package:chateo/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    moveToSplashLogin();
    super.onInit();
  }

  moveToSplashLogin() async{
 await Future.delayed(const Duration(seconds: 3));
 Get.toNamed(Routes.splashLogin);
  }
}