import 'dart:ui';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:chateo/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader{

  static void openLoadingDialog(String text, String animation){
  showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!, // use  Get.overlayContext for overlay dialogs
      builder: (_){
    return PopScope(
        canPop: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: HelperFunctions.isDarkerMode(Get.context!)? AppColors.black000E08.withOpacity(0.3):AppColors.white.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              AnimationLoader(text: text, animation: animation)
            ],),
          ),
        ));
  });
  }

  /// stop the currently open dialog
  /// this method doesn't return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using navigator
  }
}