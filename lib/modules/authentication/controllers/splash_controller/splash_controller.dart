import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    moveToNextScreen();
    super.onInit();
  }

  /// move to next base of user signing
  moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      final user = UserAuthentication.instance.user;
      if (user != null) {
        Get.toNamed(Routes.splashLogin);
      } else {
        Get.toNamed(Routes.splashLogin);
      }
    });
  }
}