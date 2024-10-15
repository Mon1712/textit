
import 'package:chateo/data/models/message_model/message_model.dart';
import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SingleChatController extends GetxController{

  /// variables
  final chatFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();
  // ignore: prefer_typing_uninitialized_variables
  var receiverId;
  RxList<MessageModel> messageModel = <MessageModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getArgsData();
    // Wait for the first frame to ensure the layout is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  // Scroll to the bottom function
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
  }
  /// get argument data
  void getArgsData(){
    receiverId = Get.arguments;
  }

  void scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

/// send message
Future<void> sendMessage(String receiverId, MessageModel messageModel ) async {
  await UserRepository.instance.saveChatRecords(
      receiverId: receiverId, messageModel: messageModel).then((_) {
    chatFieldController.clear();
    UserRepository.instance.updateChatRoomFields(
        receiverId: receiverId,
        fromId: messageModel.fromId??"",
        toId: messageModel.toId??"",
        lastMessage: messageModel.msg??"",
        timeStamp: messageModel.dateAndTime??"");
  });
}

}
