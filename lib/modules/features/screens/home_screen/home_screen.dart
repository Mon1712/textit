import 'package:chateo/modules/features/controllers/home_controller/home_controller.dart';
import 'package:chateo/modules/features/screens/home_screen/home_widgets/home_top_curved_section/home_top_curved_section.dart';
import 'package:chateo/modules/features/screens/home_screen/home_widgets/recent_chat_lists/recent_chat_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(), permanent: true);
    return  const Column(
      children: [

        /// top section contains app bar, status lists
         HomeTopCurvedSection(),

         /// contains list of recent chat
         Flexible(
          child: RecentChatList(),

        ),
      ],
    );
  }
}


