
import 'package:chateo/modules/features/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavigationController>();
    var dark = HelperFunctions.isDarkerMode(context);
    return  Scaffold(
      bottomNavigationBar: Container(
        height: Get.height*0.1,
        decoration: BoxDecoration(
          color:dark?AppColors.black000E08.withOpacity(1): AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyCDD1D0.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5
            )
          ]
        ),
        padding:  EdgeInsets.symmetric(horizontal: ScreenHeight.ten),
        child: Obx(
          ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNav(
                title: "Message",
                icon:controller.currentIndex.value ==0? AppAssets.icMessageBlue: AppAssets.icMessage,
                textColor:controller.currentIndex.value ==0?AppColors.blue3D4A7A:null ,
                onTap: (){
                  controller.currentIndex.value = 0;
                }
              ),
              bottomNav(
                  title: "Contacts",
                  icon:controller.currentIndex.value ==1? AppAssets.icContactsBlue:AppAssets.icContacts,
                  textColor:controller.currentIndex.value ==1?AppColors.blue3D4A7A:null,
                  onTap: (){
                    controller.currentIndex.value = 1;
                  }
              ),
              bottomNav(
                  title: "Settings",
                  icon:controller.currentIndex.value ==2? AppAssets.icSettingsBlue:AppAssets.icSettings,
                  textColor:controller.currentIndex.value ==2?AppColors.blue3D4A7A:null,
                  onTap: (){
                    controller.currentIndex.value = 2;
                  }
              ),
            ],
          ),
        ),
      ),

      /// body
      body: Obx(()=> controller.widgets[controller.currentIndex.value]),
    );
  }

  GestureDetector bottomNav({void Function()? onTap, required title, required String icon, Color? textColor}) {
    return GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                Text(title,style: TextStyle(color: textColor??AppColors.grey797C7B.withOpacity(0.39), fontSize: ScreenPixels.sixteen),)              ],
            ),
          );
  }
}
