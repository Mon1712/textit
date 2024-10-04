import 'package:chateo/modules/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>BottomNavigationController());
  }
}