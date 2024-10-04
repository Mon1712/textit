import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentChatController extends GetxController with GetSingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;


  @override
  void onInit() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),  // Duration of animation
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,  // You can use other curves too
      ),
    );

    // Start the animation
    controller.forward();
    super.onInit();
  }

}