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
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          // No connection has been established yet.
                            return const Center(
                              child: Text('No connection to the stream'),
                            );

                          case ConnectionState.waiting:
                          // The stream is waiting for data (typically a loading state).
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case ConnectionState.active:
                          // The stream is actively providing data.
                            if (snapshot.hasData) {
                              // Retrieving the messages from the snapshot
                              var messages = snapshot.data!.docs.map((map) =>
                                  MessageModel.fromMap(map)).toList();
                              var docId = snapshot.data!.docs.map((map) =>
                                 map.id).toList();
                              return
                                messages.isEmpty ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.4,
                                      child: TextButton(
                                        onPressed: () {
                                          controller.chatFieldController.text =
                                          "Hii! 👋";
                                        },
                                        child: Center(child: Text(
                                          "Say Hii! 👋", style: TextStyle(
                                            fontSize: ScreenPixels.eighteen
                                        ),)),
                                      ),
                                    ),
                                  ],
                                ) :

                                CListViewBuilder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenHeight
                                          .twenty,
                                      vertical: ScreenHeight.ten),
                                  itemCount: messages.length,
                                  itemBuilder: (_, index) {
                                    var messageData = messages[index];
                                    final messageTime = DateTime.parse(
                                        messageData.dateAndTime ??
                                            ""); // Assuming `sent` is a string

                                    // Check if we need to show a date separator
                                    bool showDateSeparator = true;
                                    if (index > 0) {
                                      final previousMessageDate = DateTime
                                          .parse(
                                          messages[index - 1].dateAndTime ??
                                              "");
                                      // Only show separator if the current message's date is different from the previous one
                                      showDateSeparator = messageTime.day !=
                                          previousMessageDate.day ||
                                          messageTime.month !=
                                              previousMessageDate.month ||
                                          messageTime.year !=
                                              previousMessageDate.year;
                                    }
                                    return MessageChatBubble(
                                        msg: messageData.msg ?? "",
                                        fromUserId: messageData.fromId ?? "",
                                        time: messageData.sent ?? "",
                                        messageDate: messageTime,
                                        read: messageData.read??false,
                                        showDateSeparator: showDateSeparator,
                                      receiverId: controller.contactModelArg.id,
                                      docId: messageData.id??"",
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    return 20.height;
                                  },);
                            } else {
                              // Stream is active but no data has been received yet.
                              return const Center(
                                child: Text('No data available'),
                              );
                            }

                          case ConnectionState.done:
                          // The stream has finished sending data and is closed.
                            return const Center(
                              child: Text('Stream has completed'),
                            );

                          default:
                          // If none of the above cases match, handle an unexpected state.
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                        }
                      }
                  ),
                ),

                /// Chat Text Field
                ChatTextField(
                  onTapCamera: () {},
                  onTapDocuments: () {},
                  onTapMic: () {},
                  onTapSend: () {
                    if(controller.chatFieldController.text.isNotEmpty){
                      controller.sendMessage(
                          controller.contactModelArg.id,
                          MessageModel(
                              fromId: UserAuthentication.instance.user!.uid,
                              toId: controller.contactModelArg.id,
                              read: false,
                              msg: controller.chatFieldController.text,
                              sent: DateFormat('hh:mm a')
                                  .format(DateTime.now())
                                  .toString(),
                              type: Type.text,
                              dateAndTime: DateTime.now().toString()));
                    }
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



