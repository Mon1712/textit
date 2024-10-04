
import 'package:chateo/modules/features/controllers/home_controller/home_controller.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image/custom_cached_image.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStatusLists extends StatelessWidget {
  const HomeStatusLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SizedBox(
      height: Get.height * 0.2,
      width: Get.width,
      child: Obx(
        ()=> CListViewBuilder(
          itemCount: controller.dummyStatus.length + 1, // Extra item for the "Add" button at the first index
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            /// User status
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.only(left: ScreenHeight.ten),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: ScreenHeight.sixtyFive,
                          width: ScreenHeight.sixtyFive,
                          padding: EdgeInsets.all(ScreenHeight.four),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: ScreenHeight.one),
                          ),
                          child: CustomCacheImage(
                            image: AppAssets.dummyImage,
                            imageRadius: ScreenHeight.fortyFive,
                          ),
                        ),
                        Positioned(
                          right: ScreenHeight.four,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              // Handle "+" button tap
                            },
                            child: Container(
                              height: ScreenHeight.eighteen,
                              width: ScreenHeight.eighteen,
                              padding: EdgeInsets.all(ScreenHeight.one),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.black000E08,
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: ScreenHeight.fourteen,
                                  color: AppColors.black000E08,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Text(
                      "My Status",
                      maxLines: 1,
                      style: TextStyle(color: AppColors.white, fontSize: ScreenPixels.fourteen),
                    ),
                  ],
                ),
              );
            }

            /// Friends status
            final statusIndex = index - 1; // Adjust index for statusList
            var data = controller.dummyStatus[statusIndex];
            return Padding(
              padding: EdgeInsets.only(left: ScreenHeight.ten),
              child: Column(
                children: [
                  Container(
                    height: ScreenHeight.sixtyFive,
                    width: ScreenHeight.sixtyFive,
                    padding: EdgeInsets.all(ScreenHeight.four),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: ScreenHeight.one),
                    ),
                    child: CustomCacheImage(
                      image: data["profileImage"],
                      imageRadius: ScreenHeight.fortyFive,
                    ),
                  ),
                  10.height,
                  SizedBox(
                    width: Get.width*0.2,
                    child: Text(
                      data["name"],
                        maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.white, fontSize: ScreenPixels.fourteen),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, index) {
            return 10.width;
          },
        ),
      ),
    );
  }
}
