import 'package:chateo/modules/features/controllers/home_controller/home_controller.dart';
import 'package:chateo/modules/features/screens/home_screen/home_widgets/status_lists/status_lists.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image/custom_cached_image.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/custom_clipper/custom_clipper.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeTopCurvedSection extends StatelessWidget {
  const HomeTopCurvedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Stack(
      children: [
        Positioned(
          child: ClipPath(
            clipper: CustomClipEdge(),
            child: SizedBox(
              height: Get.height * 0.38,
              width: double.infinity,
              child: const Image(image: AssetImage(AppAssets.splashBgImage),
                fit: BoxFit.cover,),
            ),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.05,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenHeight.twenty),
              child: CAppBar(
                leadingWidth: ScreenHeight.fortyFour,
                title: "Home",
                centerTitle: true,
                leading: Container(
                    padding:  EdgeInsets.all(ScreenHeight.ten),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.2)
                    ),
                    child: SvgPicture.asset(AppAssets.icSearch,
                      colorFilter: const ColorFilter.mode(
                          AppColors.white, BlendMode.srcIn),)
                ),
                actions: [
                  CustomCacheImage(
                    onTap: (){},
                    height: ScreenHeight.fortyFive,
                    width: ScreenHeight.fortyFive,
                                   image: AppAssets.dummyImage,
                    imageRadius: ScreenHeight.fortyFive,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: Get.width * 0.1,),
            const HomeStatusLists(),
          ],
        ),

        Positioned(
            left: Get.width * 0.47,
            bottom: Get.width * 0.05,
            child: SvgPicture.asset(AppAssets.icSheetBar))
      ],
    );
  }
}

