import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UsersImageDialog extends StatelessWidget {
  const UsersImageDialog({
    super.key, required this.networkImage,
  });

  final String networkImage;

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return SizedBox(
      height: Get.height * 0.4,
      width: Get.height * 0.4,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.3,
                width: Get.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                    image: DecorationImage(
                        image: NetworkImage(networkImage), fit: BoxFit.cover)
                ),
              ),

              Container(
                width: Get.height * 0.3,
                height: ScreenHeight.twentyEight,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.black000E08.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                ),
                child: const Material(
                    color: AppColors.transparent,
                    child:  Text("Alex Linderson", style: TextStyle(color: AppColors.white,fontSize: 14),)),
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.05,
            width: Get.height * 0.3,
            child: Material(
              color: dark?AppColors.black151515:AppColors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(ScreenHeight.sixteen), bottomLeft: Radius.circular(ScreenHeight.sixteen)),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHeight.twenty),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dialogIcons(iconImage:AppAssets.icMessageBlue, onTap: (){}),
                    dialogIcons(iconImage:AppAssets.icPhoneBlue, onTap: (){}),
                    dialogIcons(iconImage:AppAssets.icVideoCall, onTap: (){}),
                    dialogIcons(iconImage:  AppAssets.icInfoLightBlue, onTap: (){
                      Get.toNamed(Routes.userInfo);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dialogIcons({required String iconImage, void Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(iconImage,colorFilter: const ColorFilter.mode(AppColors.blue3D4A7A, BlendMode.srcIn),),);
  }
}