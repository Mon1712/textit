import 'dart:ui';

import 'package:chateo/utils/dialogs/user_image_dialog/user_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ShowUserImageDialog {

  static void showUserImageDialog(
      { required String networkImage}) {
    Get.dialog(GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Animate(
              effects: const [
                MoveEffect(

                ),
                ScaleEffect(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 500),
                ),
              ],
              child: UsersImageDialog(
                networkImage: networkImage,
              ),
            ),
          ),
        ],
      ),
    ),
        barrierDismissible: true);
  }

}
