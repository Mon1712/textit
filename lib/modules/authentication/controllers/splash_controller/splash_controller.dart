import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    moveToNextScreen();
    super.onInit();
  }

  /// move to next base of user signing
   Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) async{
      if( await _checkPermission()){
        final user = UserAuthentication.instance.user;
        if (user != null) {
          Get.offAllNamed(Routes.bottomNav);
        } else {
          Get.toNamed(Routes.splashLogin);
        }
      }
    });
  }

  /// Check and request contact permission
  Future<bool> _checkPermission() async {
    var permissionStatus = await Permission.contacts.status;

    if (permissionStatus.isDenied) {
      permissionStatus = await Permission.contacts.request();
    }
    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return permissionStatus.isGranted;
  }

}