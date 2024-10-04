import 'package:chateo/modules/widgets/cached_image/custom_cached_image/custom_cached_image.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
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

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                child: ClipPath(
                  clipper: CustomClipEdge(),
                  child: SizedBox(
                    height: Get.height * 0.42,
                    width: double.infinity,
                    child: const Image(image: AssetImage(AppAssets.splashBgImage),
                      fit: BoxFit.cover,),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHeight.ten, vertical:ScreenHeight.ten ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Get.width * 0.15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){Get.back();},
                            child: const Icon(Icons.arrow_back_outlined, color: AppColors.white,)),
                        CustomCacheImage(image: AppAssets.dummyUser3,
                        height: ScreenHeight.eightyTwo,
                          width: ScreenHeight.eightyTwo,
                          imageRadius: ScreenHeight.eightyTwo,
                        ),
                        20.width
                      ],
                    ),
                    10.height,
                    Text("Alex Linderson", style: TextStyle(
                      fontSize: ScreenPixels.twenty,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white ,
                    ),),

                    Text("@jhonabraham", style: TextStyle(
                      fontSize: ScreenPixels.twelve,
                      color: AppColors.white ,
                    ),),
                    20.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenHeight.thirty),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCircularIcon(
                            icon: AppAssets.icMessageBlue
                          ),
                          buildCircularIcon(
                              icon: AppAssets.icVideoCall
                          ),
                          buildCircularIcon(
                              icon: AppAssets.icPhoneBlue
                          ),
                          buildCircularIcon(
                              icon: AppAssets.icMore
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Positioned(
                  left: Get.width * 0.47,
                  bottom: Get.width * 0.05,
                  child: SvgPicture.asset(AppAssets.icSheetBar))
            ],
          ),
          buildColumn(dark: dark, title: "Display Name", desc: "Alex Linderson"),
          buildColumn(dark: dark, title: "Email Address", desc: "jhonabraham20@gmail.com"),
          buildColumn(dark: dark, title: "Address", desc: "33 street west subidbazar,sylhet"),
          buildColumn(dark: dark, title: "Phone  Number", desc: "(320) 555-0104")
        ],
      ),


    );
  }

  CircularIcon buildCircularIcon({required String icon, void Function()? onTap}) {
   return CircularIcon(
     onTap: onTap,
      svgIcon: icon,
      containerColor: AppColors.white.withOpacity(0.2),
      paddingAll: ScreenHeight.ten,
     colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
    );
  }

  Widget buildColumn({
    required bool dark,
    required String title,
    required String desc,
}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenHeight.twenty, horizontal: ScreenHeight.twenty),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
            fontSize: ScreenPixels.twelve,
            color: dark ? AppColors.grey797C7B : AppColors
                .grey797C7B.withOpacity(0.5),
          ),),
          Text(desc, style: TextStyle(
            fontSize: ScreenPixels.eighteen,
            fontWeight: FontWeight.w500,
          ),),
        ],
      ),
    );
  }
}
