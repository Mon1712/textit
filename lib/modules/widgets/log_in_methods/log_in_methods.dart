import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInMethods extends StatelessWidget {
  const LogInMethods({
    super.key, this.onTapFb, this.onTapGoogle, this.onTapApple, this.appleColor,
  });

  final void Function()? onTapFb;
  final void Function()? onTapGoogle;
  final void Function()? onTapApple;
  final Color? appleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       signInMethods(icon: AppAssets.icFb,onTap: onTapFb),
        20.width,
        signInMethods(icon: AppAssets.icGoogle,onTap: onTapGoogle),
        20.width,
        signInMethods(icon: AppAssets.icApple,onTap: onTapApple, iconColor: appleColor),
      ],
    );
  }
  
  Widget signInMethods({void Function()? onTap,required String icon, Color? iconColor}){
    return  InkWell(
      onTap:onTap,
      child: Container(
        height: ScreenPixels.fifty,
        width: ScreenPixels.fifty,
        padding:  EdgeInsets.all(ScreenPixels.ten),
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.19),
            shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon,color:iconColor ,),
      ),
    );
  }
}