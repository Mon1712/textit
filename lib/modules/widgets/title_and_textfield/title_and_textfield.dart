import 'package:chateo/modules/widgets/custom_text_field/custom_text_field.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';

class TitleAndTextField extends StatelessWidget {
  const TitleAndTextField({
    super.key, required this.title, this.suffixIcon, this.obscureText = false, this.controller, this.readOnly=false, this.onTap,
  });

  final String title;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(
            color: dark ? AppColors.blueA1B5D8 : AppColors.blue3D4A7A),),
        CTextField(
          suffixIcon: suffixIcon,
          obscureText: obscureText,
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
        ),
      ],
    );
  }
}
