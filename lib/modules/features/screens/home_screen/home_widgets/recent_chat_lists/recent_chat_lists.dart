import 'package:chateo/modules/features/controllers/home_controller/home_controller.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image_stack/custom_cached_image_stack.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentChatList extends StatelessWidget {
  const RecentChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    var dark = HelperFunctions.isDarkerMode(context);
    return CListViewBuilder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
            vertical: ScreenHeight.ten
        ),
        itemCount: 10,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              if (controller.selectedList.contains(index)) {
                controller.selectedList.remove(index);
              } else {
                if (controller.selectedList.isNotEmpty) {
                  controller.selectedList.add(index);
                }else{
                  controller.moveToSingleChat();
                }
              }
            },
            onLongPress: () {
              if (controller.selectedList.isEmpty) {
                controller.selectedList.add(index);
              }
              else if (controller.selectedList.contains(index)) {
                controller.selectedList.remove(index);
              }
              else {
                controller.selectedList.add(index);
              }
            },
            child: Obx(
                  () =>
                  Container(
                    color: controller.selectedList.contains(index) ? (dark
                        ? AppColors.blue003B5C
                        : AppColors.blueF1F6FA) : null,
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHeight.fifteen,
                        vertical: ScreenHeight.ten),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCachedImageStack(
                          height: ScreenHeight.sixty,
                          width: ScreenHeight.sixty,
                          image: AppAssets.dummyImage,
                          imageRadius: ScreenHeight.fifty,
                          positionRight: ScreenHeight.four,
                          positionBottom: ScreenHeight.six,
                          child: Container(
                            height: ScreenHeight.eight,
                            width: ScreenHeight.eight,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green0FE16D
                            ),
                          ),
                          onTap: () {
                            controller.showUserImageDialog(
                              AppAssets.dummyImage,);
                          },
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alex Linderson", style: TextStyle(
                              fontSize: ScreenPixels.twenty,
                              fontWeight: FontWeight.w500,
                            ),),
                            Text("How are you today?", style: TextStyle(
                              fontSize: ScreenPixels.twelve,
                              color: dark ? AppColors.grey797C7B : AppColors
                                  .grey797C7B.withOpacity(0.5),
                            ),),

                          ],
                        ),
                        const Spacer(),
                        controller.selectedList.contains(index) ?
                        Row(
                          children: [
                            CircularIcon(
                              svgIcon: AppAssets.icNotification,
                              containerColor: AppColors.black000E08,
                              onTap: () {},
                            ),
                            10.width,
                            CircularIcon(
                              svgIcon: AppAssets.icDelete,
                              containerColor: AppColors.redEA3736,
                              onTap: () {},
                            ),
                          ],
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("2 min ago", style: TextStyle(
                              fontSize: ScreenPixels.twelve,
                              color: dark ? AppColors.grey797C7B : AppColors
                                  .grey797C7B.withOpacity(0.5),
                            ),),
                            // 5.height,
                            Container(
                              padding: EdgeInsets.all(ScreenHeight.six),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.redF04A4C
                              ),
                              child: Text("3", style: TextStyle(
                                fontSize: ScreenPixels.twelve,
                                color: AppColors.white,
                                fontWeight: FontWeight.w900,
                              ),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return 10.height;
        });
  }
}

