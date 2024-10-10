
import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:chateo/modules/contacts/controllers/contacts_controller/contacts_controller.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image/custom_cached_image.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/custom_clipper/custom_clipper.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactsScreens extends StatelessWidget {
  const ContactsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    final controller = Get.put(ContactsController());
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
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHeight.twenty,
                        vertical: ScreenHeight.twenty),
                    child: CAppBar(
                      leading: CircularIcon(svgIcon: AppAssets.icSearch,
                        containerColor: AppColors.white.withOpacity(0.2),
                        paddingAll: ScreenHeight.ten,),
                      leadingWidth: ScreenHeight.fortyFour,
                      title: "Contacts",
                      centerTitle: true,
                      actions: [
                        CircularIcon(svgIcon: AppAssets.icAddContact,
                          containerColor: AppColors.white.withOpacity(0.2),)
                      ],
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

          /// Body
          StreamBuilder(
              stream: UserRepository.instance.getAllUser,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Something went wrong: ${snapshot.error}'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data found'),
                  );
                }
                if (controller.contacts == null) {
                  return const Center(
                    child: Text('No contacts was found'),
                  );
                }
                if (controller.contactDetailsList.isEmpty) {
                  return const Center(
                    child: Text('No contacts was found'),
                  );
                }

                var contacts = controller.filteredList(
                    snapshot, controller.contacts!);
                return
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// firebase contact lists
                          CListViewBuilder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: contacts.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (_, index) {
                                var contactData = contacts[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenHeight.ten,
                                        vertical: ScreenHeight.ten),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        CustomCacheImage(
                                          color: AppColors.blueA1B5D8
                                              .withOpacity(0.5),
                                          height: ScreenHeight.sixty,
                                          width: ScreenHeight.sixty,
                                          image: contactData.profileImage ?? "",
                                          imageRadius: ScreenHeight.fifty,
                                          onTap: () {},
                                        ),
                                        10.width,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              contactData.name ?? "",
                                              style: TextStyle(
                                                fontSize: ScreenPixels.twenty,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                            Text(
                                              HelperFunctions.formatPhoneNumber(
                                                  contactData.phoneNumber ??
                                                      ""),
                                              style: TextStyle(
                                                fontSize: ScreenPixels.twelve,
                                                color: dark
                                                    ? AppColors.grey797C7B
                                                    : AppColors
                                                    .grey797C7B.withOpacity(
                                                    0.5),
                                              ),),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return 10.height;
                              }),
                          30.height,


                          /// invite contact lists
                          Padding(
                            padding: EdgeInsets.only(left: ScreenHeight.ten),
                            child: Text(
                              "Invite people on Textit", style: TextStyle(
                              fontSize: ScreenPixels.eighteen,
                              color: dark
                                  ? AppColors.grey797C7B
                                  : AppColors
                                  .grey797C7B.withOpacity(0.5),
                            ),),
                          ),
                          10.height,
                          CListViewBuilder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.contactDetailsList.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (_, index) {
                                var contactData = controller
                                    .contactDetailsList[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenHeight.ten,
                                        vertical: ScreenHeight.ten),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Container(
                                          height: ScreenHeight.sixty,
                                          width: ScreenHeight.sixty,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.blueA1B5D8
                                                .withOpacity(0.5),
                                          ),
                                          child: Text(
                                              contactData.name.substring(0, 1)),
                                        ),
                                        10.width,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.7,
                                              child: Text(
                                                contactData.name ?? "",
                                                style: TextStyle(
                                                  fontSize: ScreenPixels.twenty,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              contactData.phoneNumber ?? "",
                                              style: TextStyle(
                                                fontSize: ScreenPixels.twelve,
                                                color: dark
                                                    ? AppColors.grey797C7B
                                                    : AppColors
                                                    .grey797C7B.withOpacity(
                                                    0.5),
                                              ),),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return 10.height;
                              }),
                        ],
                      ),
                    ),
                  );
              }
          )
        ],
      ),
    );
  }
}
