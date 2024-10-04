import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ShowDatePicker {

  ShowDatePicker._();

  static Future<String> showDate(
      {required BuildContext context, required DateTime firstDate, required DateTime lastDate, String? helpText, String? cancelText, String? confirmText,
        required bool dark
      }) async {
    final DateTime? datePicker = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(
            useMaterial3: true, // Keeping Material 3 disabled if preferred
          ).copyWith(
            colorScheme:dark? const ColorScheme.dark(
              primary: AppColors.black151515, // Header and selected date highlight
            ): const ColorScheme.light(
              primary: AppColors.white, // Header and selected date highlight
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors
                    .blue3D4A7A, // "OK" and "CANCEL" button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return datePicker.toString().split(' ')[0];
  }

}