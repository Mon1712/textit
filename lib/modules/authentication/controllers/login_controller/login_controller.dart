import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/loaders/loaders.dart';
import 'package:chateo/utils/network_manager/network_manager.dart';
import 'package:chateo/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  /// variables
  RxBool obscureText = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  /// toggle obscure
 void toggleObscure(){
   obscureText.value = !obscureText.value;
 }

  /// move to bottom Nav
  void moveToBottomNav(){
    Get.toNamed(Routes.bottomNav);
  }


  /// login to the app
  void login() async {
    try {
      // start the loader
      FullScreenLoader.openLoadingDialog(
          "Logging into the account.......", AppAssets.lottieLoader);

      // check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // check form validation
      if (!loginKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// calls sign in method
      await UserAuthentication.instance
          .signInByEmailPassword(
          email: emailController.text.trim(),
          password: passController.text.trim()).then((credentials) async {
        FullScreenLoader.stopLoading();
        moveToBottomNav();
        Loaders.successSnackBar(title: "Logged in to account Successfully");
      });
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: "$e");
    }
  }
}