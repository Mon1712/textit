import 'package:flutter/material.dart';

class HelperFunctions{
  HelperFunctions._();

  static bool isDarkerMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}