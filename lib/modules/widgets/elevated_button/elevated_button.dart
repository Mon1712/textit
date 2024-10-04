import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:flutter/material.dart';

class CElevatedButton extends StatelessWidget {
  const CElevatedButton({
    super.key, required this.btnName, required this.btnColor, required this.textColor, this.onPressed, this.padding,
  });

  final String btnName;
  final Color btnColor;
  final Color textColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white.withOpacity(0.37),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenPixels.sixteen),
        ),
        padding:padding??  EdgeInsets.symmetric(vertical: ScreenPixels.fifteen)
    ) ,child: Text(btnName,  style: TextStyle(color: textColor, fontSize: ScreenPixels.sixteen,),));
  }
}
