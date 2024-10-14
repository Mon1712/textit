
import 'package:chateo/data/models/contact_model/contact_model.dart';
import 'package:chateo/data/models/message_model/message_model.dart';
import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SingleChatController extends GetxController{

  /// variables
  final chatFieldController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var contactModelArg;
  RxList<MessageModel> messageModel = <MessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getArgsData();
  }

  /// get argument data
  void getArgsData(){
    contactModelArg = Get.arguments as ContactModel;
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