import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context, Curve? curve, Alignment? alignment, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {

    // Create a custom transition (e.g., fading combined with sliding)
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),  // Start from right
        end: Offset.zero,          // End at center
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,  // Apply fade animation
        child: child,
      ),
    );
  }
}