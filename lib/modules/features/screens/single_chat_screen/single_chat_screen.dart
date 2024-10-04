import 'package:chateo/modules/features/controllers/single_chat_controller/single_chat_controller.dart';
import 'package:chateo/modules/features/screens/single_chat_screen/message_chat_bubble/message_chat_bubble.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image_stack/custom_cached_image_stack.dart';
import 'package:chateo/modules/widgets/chat_text_field/chat_text_field.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingleChatController());
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(

          /// app bar
          appBar: CAppBar(
            titleWidget: Row(
              children: [
                CustomCachedImageStack(
                  height: ScreenHeight.fortyFour,
                  width: ScreenHeight.fortyFour,
                  image: AppAssets.dummyUser2,
                  imageRadius: ScreenHeight.fortyFour,
                  positionRight: ScreenHeight.two,
                  positionBottom: ScreenHeight.four,
                  child: Container(
                    height: ScreenHeight.eight,
                    width: ScreenHeight.eight,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green0FE16D
                    ),
                  ),
                ),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jhon Abraham", style: TextStyle(
                        fontSize: ScreenPixels.sixteen,
                        fontWeight: FontWeight.w500
                    ),),
                    Text("Active now", style: TextStyle(
                        fontSize: ScreenPixels.twelve,
                        color: AppColors.grey797C7B.withOpacity(0.8)
                    ),)
                  ],
                )
              ],
            ),
            centerTitle: false,
            leadingWidth: ScreenHeight.forty,
            actions: [
              IconButton(onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.icPhoneBlue)),
              IconButton(onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.icVideoCall)),
              5.width
            ],
          ),

          /// body
          body: SingleChildScrollView(
            child: Column(
              children: [

                /// Chat Box
                SizedBox(
                  height: Get.height*0.78,
                  child: CListViewBuilder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal:  ScreenHeight.ten,vertical:  ScreenHeight.ten),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return MessageChatBubble(msg: "Hi! i'm using Textit", index: index,);
                    },
                    separatorBuilder: (_, index) {
                      return 20.height;
                    },),
                ),

                /// Chat Text Field
                ChatTextField(
                  onTapCamera: () {},
                  onTapDocuments: () {},
                  onTapMic: () {},
                  onTapSend: () {},
                  controller: controller.chatFieldController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



