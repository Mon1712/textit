import 'package:chateo/modules/contacts/screens/contacts_screen/contacts_screens.dart';
import 'package:chateo/modules/features/screens/home_screen/home_screen.dart';
import 'package:chateo/modules/settings/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController{

  /// variables
  RxInt currentIndex = 0.obs;
  RxList<Widget> widgets = <Widget>[
    const HomeScreen(),
     const ContactsScreens(),
    const SettingsScreen()
  ].obs;

}