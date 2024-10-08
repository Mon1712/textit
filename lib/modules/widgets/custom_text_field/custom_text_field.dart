import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key, this.controller, this.suffixIcon, this.obscureText = false, this.readOnly=false, this.onTap, this.autoValidateMode, this.validator, this.inputFormatters, this.keyboardType, this.hintText,
  });
  final  TextEditingController? controller;
final Widget? suffixIcon;
final bool obscureText;
final bool readOnly;
final void Function()? onTap;
final AutovalidateMode? autoValidateMode;
final String? Function(String?)? validator;
final List<TextInputFormatter>? inputFormatters;
final TextInputType? keyboardType;
final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      autovalidateMode: autoValidateMode,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: ScreenPixels.fourteen, color: AppColors.grey797C7B.withOpacity(0.8)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(color: AppColors.blue3D4A7A,
            fontWeight: FontWeight.w500,
            fontSize: ScreenPixels.fourteen),
        suffixIcon: suffixIcon,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyCDD1D0)
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyCDD1D0)
        ),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.redFF2D1B)
        ),
      ),
    );
  }
}