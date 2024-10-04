import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/themes/theme_text/theme_text.dart';
import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      textTheme:AppThemeText.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.black000E08,
    brightness: Brightness.dark,
    textTheme:AppThemeText.darkTextTheme,
  );

}