import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:chateo/modules/widgets/custom_paint/chat_bubble_end_point/chat_bubble_end_point.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageChatBubble extends StatelessWidget {
  const MessageChatBubble({
    super.key,
    required this.msg,
    required this.fromUserId,
    required this.time,
    required this.showDateSeparator,
    required this.messageDate, required this.read, this.receiverId, required this.docId,
  });

  final String msg;
  final String docId;
  final String fromUserId;
  final String time;
  final bool showDateSeparator;
  final bool read;
  final DateTime messageDate;
  final String ? receiverId;
  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    bool isUser = UserAuthentication.instance.user!.uid == fromUserId;
    if(!read) {
      if(!isUser){
        UserRepository.instance.updateSingleField(receiverId: receiverId??"",docId:docId);
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (showDateSeparator) buildDateSeparator(messageDate,dark),
        10.height,
        Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            CustomPaint(
              painter: ChatBubbleEndPoint(
                isUser
                    ? (dark ? AppColors.senderDark : AppColors.senderLight)
                    : (dark ? AppColors.receiverDark : AppColors.receiverLight),
                isUser,
              ),
              child: Container(
                padding: EdgeInsets.all(ScreenHeight.ten),
                decoration: BoxDecoration(
                  color: isUser
                      ? (dark ? AppColors.senderDark : AppColors.senderLight)
                      : (dark ? AppColors.receiverDark : AppColors.receiverLight),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(ScreenHeight.eighteen),
                    bottomLeft: Radius.circular(ScreenHeight.eighteen),
                    topRight: Radius.circular(isUser ? 0 : ScreenHeight.eighteen),
                    topLeft: Radius.circular(isUser ? ScreenHeight.eighteen : 0),
                  ),
                ),
                constraints: BoxConstraints(maxWidth: Get.width * 0.7), // Adjusted from 0.8 to 0.7
                child: Text(
                  msg,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: ScreenPixels.fourteen,
                    fontWeight: FontWeight.w500,
                    color: isUser ? AppColors.white : AppColors.black000E08,
                  ),
                ),
              ),
            ),
          ],
        ),
        5.height,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: ScreenPixels.ten,
                  color: AppColors.grey797C7B.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          5.width,
          Visibility(
              visible: isUser,
              child: read?  Icon(Icons.done_all_rounded,color: Colors.blue,size: ScreenHeight.sixteen,) :  Icon(Icons.done_all_rounded, color: AppColors.grey797C7B,size:  ScreenHeight.sixteen,))
          ],
        ),
      ],
    );
  }

  Widget buildDateSeparator(DateTime messageDate,bool dark) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    String dateText;

    if (messageDate.isAfter(today) && messageDate.isBefore(tomorrow)) {
      dateText = "Today";
    } else if (messageDate.isBefore(today) &&
        messageDate.isAfter(today.subtract(const Duration(days: 1)))) {
      dateText = "Yesterday";
    } else if (messageDate.isAfter(tomorrow)) {
      dateText = "Tomorrow";
    } else {
      // If it's not today or tomorrow, format the date as "Month Day, Year"
      dateText = DateFormat('MMMM dd, yyyy').format(messageDate);
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: dark ? AppColors.receiverDark : AppColors.receiverLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          dateText,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
