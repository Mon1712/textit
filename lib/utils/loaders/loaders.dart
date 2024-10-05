
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loaders{

  static successSnackBar({required String title, message=""}) {
    Get.snackbar(
        title, // Title
        message, // Message
        snackPosition: SnackPosition.BOTTOM,
        // Position of the snack bar
        backgroundColor: Colors.lightGreen,
        // Background color for warning
        colorText: AppColors.white,
        // Text color
        icon: const Icon(Icons.check, color: AppColors.white),
        // Icon to show with the snack bar
        borderRadius: 8,
        // Border radius for rounded corners
        margin: const EdgeInsets.all(20),
        // Margins around the snack bar
        duration: const Duration(seconds: 3),
        // Duration the snack bar will be displayed
        isDismissible: true,
        // Allow the user to swipe the snack bar away
        shouldIconPulse: true
    );
  }

    static warningSnackBar({required String title, message=""}) {
      Get.snackbar(
          title, // Title
          message, // Message
          snackPosition: SnackPosition.BOTTOM,
          // Position of the snack bar
          backgroundColor: Colors.orange,
          // Background color for warning
          colorText: AppColors.white,
          // Text color
          icon: const Icon(Icons.warning, color: AppColors.white),
          // Icon to show with the snack bar
          borderRadius: 8,
          // Border radius for rounded corners
          margin: const EdgeInsets.all(20),
          // Margins around the snack bar
          duration: const Duration(seconds: 3),
          // Duration the snack bar will be displayed
          isDismissible: true,
          // Allow the user to swipe the snack bar away
          shouldIconPulse: true
      );
    }

  static errorSnackBar({required String title, message=""}) {
    Get.snackbar(
        title, // Title
        message, // Message
        snackPosition: SnackPosition.BOTTOM,
        // Position of the snack bar
        backgroundColor: Colors.redAccent,
        // Background color for warning
        colorText: AppColors.white,
        // Text color
        icon: const Icon(Icons.warning, color: AppColors.white),
        // Icon to show with the snack bar
        borderRadius: 8,
        // Border radius for rounded corners
        margin: const EdgeInsets.all(20),
        // Margins around the snack bar
        duration: const Duration(seconds: 3),
        // Duration the snack bar will be displayed
        isDismissible: true,
        // Allow the user to swipe the snack bar away
        shouldIconPulse: true
    );
  }
}