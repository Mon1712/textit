
import 'package:flutter/material.dart';


class HelperFunctions {
  HelperFunctions._();

  static bool isDarkerMode(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters (just in case)
    String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure the cleaned phone number has exactly 10 digits
    if (cleaned.length != 10) {
      throw const FormatException("Phone number must have exactly 10 digits");
    }
    // Format the phone number as (XXX) XXX-XXXX
    String formattedNumber = '(${cleaned.substring(0, 3)}) ${cleaned.substring(
        3, 6)}-${cleaned.substring(6)}';

    return formattedNumber;
  }
}
