import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/dialogs/show_user_image_dialog/show_user_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{
  late AnimationController animationController;
  RxBool onLongPressed = false.obs;
  RxList<int> selectedList = <int>[].obs;
  RxList<int> statusList = <int>[1,2,3].obs;
  RxList<Map<String,dynamic>> dummyStatus = <Map<String,dynamic>>[
    {
      "name":"Shawn Micheal",
      "profileImage":AppAssets.dummyUser1
    },
    {
      "name":"Martha Mayer",
      "profileImage":AppAssets.dummyUser3
    },
    {
      "name":"Phillip Glenn",
      "profileImage":AppAssets.dummyUser2
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
    animationController.forward();
  }

  /// show users profile picture dialog
  void showUserImageDialog(String networkImage){
    ShowUserImageDialog.showUserImageDialog(networkImage: networkImage,);
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


/// move to single chat
  void moveToSingleChat(String receiverId) {
    0.2.delay( () {
     Get.toNamed(Routes.singleChat, arguments:receiverId );
   });
  }




}