import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageChatBubble extends StatelessWidget {
  const MessageChatBubble({
    super.key, required this.msg, this.index,
  });

  final String msg;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: index!.isEven? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHeight.five,
                  vertical: ScreenHeight.ten),
              decoration: BoxDecoration(
                  color: index!.isEven?  AppColors.blue3D4A7A : AppColors.blueA1B5D8,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                        ScreenHeight.twelve),
                    bottomLeft: Radius.circular(
                        ScreenHeight.twelve),
                    topRight: Radius.circular(
                        index!.isEven?0: ScreenHeight.twelve),
                    topLeft: Radius.circular(
                       index!.isEven? ScreenHeight.twelve:0),)
              ),
              constraints: BoxConstraints(
                  maxWidth: Get.width * 0.8),
              child:  Text(
                softWrap: true,
                msg,style: TextStyle(
                fontSize: ScreenPixels.fourteen,
                color:  index!.isEven? AppColors.white:AppColors.black000E08,
              ),),
            ),
            10.height,
            Text("09:25 AM",style: TextStyle(
                fontSize: ScreenPixels.ten,
                color: AppColors.grey797C7B.withOpacity(0.8),
                fontWeight: FontWeight.w900
            ),)
          ],
        ),
      ],
    );
  }
}