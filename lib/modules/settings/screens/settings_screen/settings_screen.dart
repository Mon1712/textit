import 'package:chateo/modules/widgets/cached_image/custom_cached_image/custom_cached_image.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/custom_clipper/custom_clipper.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return Scaffold(

      /// body
      body: Column(
        children: [

          /// heading
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipEdge(),
                child: SizedBox(
                  height: Get.height * 0.22,
                  width: Get.width,
                  child: const Image(
                    image: AssetImage(AppAssets.splashBgImage,),
                    fit: BoxFit.cover,),
                ),
              ),
               Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: ScreenHeight.twenty),
                    child: const CAppBar(
                      title: "Settings",
                      centerTitle: true,
                      iconColor: AppColors.white,
                      backArrowVisible: false,
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: Get.height * 0.02,
                  left: Get.width * 0.45,
                  child: SvgPicture.asset(AppAssets.icSheetBar))
            ],
          ),
          Column(
            children: [

              /// user info
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenPixels.ten,
                    vertical: ScreenPixels.twenty),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: dark
                        ? AppColors.greyF5F6F6.withOpacity(0.1)
                        : AppColors.greyF5F6F6,))
                ),
                child: Row(
                  children: [
                    CustomCacheImage(
                      height: ScreenPixels.sixty,
                      width: ScreenPixels.sixty,
                      image: AppAssets.dummyImage,
                      imageRadius: ScreenPixels.sixty,
                    ),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alex Linderson", style: TextStyle(
                          fontSize: ScreenPixels.twenty,
                          fontWeight: FontWeight.w700,
                        ),),
                        Text("Never give up", style: TextStyle(
                          fontSize: ScreenPixels.twelve,
                          color: dark ? AppColors.grey797C7B : AppColors
                              .grey797C7B.withOpacity(0.5),
                        ),),
                      ],
                    ),
                    const Spacer(),
                    CircularIcon(
                      svgIcon: AppAssets.icQrScan,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),

          /// setting features
          Flexible(
            child: SingleChildScrollView(
              child:
              Column(
                children: [
                  settingFeatures(dark: dark,
                      title: "Account",
                      desc: "Privacy, security, change number",
                      onTap: () {},
                    icon: AppAssets.icKey
                  ),
                  settingFeatures(dark: dark,
                      title: "Chat",
                      desc: "Chat history, theme, wallpapers",
                      onTap: () {},
                      icon: AppAssets.icMessage
                  ),
                  settingFeatures(dark: dark,
                      title: "Notifications",
                      desc: "Messages, group and others",
                      onTap: () {},
                      icon: AppAssets.icNotification
                  ),
                  settingFeatures(dark: dark,
                      title: "Help",
                      desc: "Help center, contact us, privacy policy",
                      onTap: () {},
                      icon: AppAssets.icHelp
                  ),
                  settingFeatures(dark: dark,
                      title: "Storage and data",
                      desc: "Network usage, storage usage",
                      onTap: () {},
                      icon: AppAssets.icData
                  ),
                  settingFeatures(dark: dark,
                      title: "Invite a friend",
                      desc: "Privacy, security, change number",
                      onTap: () {},
                      icon: AppAssets.icInviteFriends
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget settingFeatures({required bool dark,required String title,  String ? desc,  void Function()? onTap, required String icon }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenPixels.ten, vertical: ScreenPixels.twenty),
        child: Row(
          children: [
            CircularIcon(
              svgIcon: icon,
              containerColor: AppColors.blueDEEBFF,
              paddingAll: ScreenHeight.ten,
              colorFilter: ColorFilter.mode(AppColors.grey797C7B, BlendMode.srcIn),
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  fontSize: ScreenPixels.sixteen,
                  fontWeight: FontWeight.w500,
                ),),
                Text(desc??"", style: TextStyle(
                  fontSize: ScreenPixels.twelve,
                  color: dark ? AppColors.grey797C7B : AppColors
                      .grey797C7B.withOpacity(0.5),
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
