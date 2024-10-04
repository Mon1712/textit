import 'package:chateo/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashLoginController extends GetxController with GetTickerProviderStateMixin{

  /// variable 
  late AnimationController animationController;
  late Animation animation;
  
  /// move to log in
  void moveToLogIn(){
    Get.toNamed(Routes.logIn);
  }

  /// move to sign up
  void moveToSignUp(){
    Get.toNamed(Routes.signUp);
  }

  /// move to bottomNav
  void moveToBottomNav(){
    Get.toNamed(Routes.bottomNav);
  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 10),)
      ..repeat(reverse: true);


  }
  
}