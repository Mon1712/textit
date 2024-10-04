import 'package:chateo/modules/authentication/screens/login_screen/login_screen.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key, this.onTapDocuments, this.onTapCamera, this.onTapMic, this.onTapSend, this.controller,
  });

  final void Function()? onTapDocuments;
  final void Function()? onTapCamera;
  final void Function()? onTapMic;
  final void Function()? onTapSend;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHeight.ten, vertical: ScreenHeight.twenty),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(
              color: dark ? AppColors.greyEEFAF8.withOpacity(0.1) : AppColors
                  .greyEEFAF8, width: ScreenHeight.one),)
      ),
      child: Row(children: [

        /// documents
        CircularIcon(
          onTap: onTapDocuments,
          svgIcon: AppAssets.icDocuments,
          colorFilter: ColorFilter.mode(
              dark ? AppColors.white : AppColors.blue3D4A7A, BlendMode.srcIn),),
        5.width,

        /// text field
        Expanded(
          child: SizedBox(
            height: ScreenHeight.forty,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Write your message",
                  filled: true,
                  fillColor: dark ? AppColors.black151515 : AppColors
                      .blueF3F6F6,
                  hintStyle: TextStyle(
                      color: dark ? AppColors.white : AppColors.grey797C7B
                          .withOpacity(0.8), fontSize: ScreenPixels.twelve),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(ScreenHeight.twelve),
                      borderSide: const BorderSide(color: AppColors.transparent)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(ScreenHeight.twelve),
                      borderSide: const BorderSide(color: AppColors.transparent)
                  ),
                  suffixIcon: InkWell(
                    onTap: onTapSend,
                    child: SvgPicture.asset(
                      AppAssets.icSend, fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          dark ? AppColors.white : AppColors.blue3D4A7A,
                          BlendMode.srcIn),),
                  )
              ),
            ),
          ),
        ),
        5.width,

        /// camera
        CircularIcon(
          onTap: onTapCamera,
          svgIcon: AppAssets.icCamera,
          colorFilter: ColorFilter.mode(
              dark ? AppColors.white : AppColors.blue3D4A7A, BlendMode.srcIn),),

        /// mic
        CircularIcon(
          onTap: onTapMic,
          svgIcon: AppAssets.icMic,
          colorFilter: ColorFilter.mode(
              dark ? AppColors.white : AppColors.blue3D4A7A, BlendMode.srcIn),),
      ],),
    );
  }
}
