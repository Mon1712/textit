import 'package:chateo/data/models/message_model/message_model.dart';
import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:chateo/modules/features/controllers/single_chat_controller/single_chat_controller.dart';
import 'package:chateo/modules/features/screens/single_chat_screen/message_chat_bubble/message_chat_bubble.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image_stack/custom_cached_image_stack.dart';
import 'package:chateo/modules/widgets/chat_text_field/chat_text_field.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SingleChatController>();
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
                  color: AppColors.blueA1B5D8.withOpacity(0.5),
                  image: controller.contactModelArg.profileImage,
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
                    Text(controller.contactModelArg.name, style: TextStyle(
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
                  icon: SvgPicture.asset(AppAssets.icVideoCall,
                    colorFilter: const ColorFilter.mode(
                        AppColors.blue3D4A7A, BlendMode.srcIn),)),
              5.width
            ],
          ),

          /// body
          body: SingleChildScrollView(
            child: Column(
              children: [

                /// Chat Box
                SizedBox(
                  height: Get.height * 0.78,
                  child: StreamBuilder(
                      stream: UserRepository.instance.getAllChats(
                          receiverId: controller.contactModelArg.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text(
                              "Error: ${snapshot.error}"));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text("No messages found"));
                        }

                        // Retrieving the messages from the snapshot
                        var messages = snapshot.data!.docs.map((map)=>MessageModel.fromMap(map));
                        print(messages);
                        return CListViewBuilder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: ScreenHeight
                              .ten,
                              vertical: ScreenHeight.ten),
                          itemCount: messages.length,
                          itemBuilder: (_, index) {
                            var messageData = messages.first;
                            return MessageChatBubble(
                              msg:messageData.msg??"",
                              fromUserId: UserAuthentication.instance.user!.uid,
                              time: messageData.sent??"",
                            );
                          },
                          separatorBuilder: (_, index) {
                            return 20.height;
                          },);
                      }
                  ),
                ),

                /// Chat Text Field
                ChatTextField(
                  onTapCamera: () {},
                  onTapDocuments: () {},
                  onTapMic: () {},
                  onTapSend: () {
                    controller.sendMessage(
                        controller.contactModelArg.id, MessageModel(
                        fromId: UserAuthentication.instance.user!.uid,
                        toId: controller.contactModelArg.id,
                        read: "de",
                        msg: controller.chatFieldController.text,
                        sent: DateFormat('hh:mm a')
                            .format(DateTime.now())
                            .toString(),
                        type: Type.text
                    ));
                  },
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



