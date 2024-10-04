import 'package:chateo/modules/features/controllers/single_chat_controller/single_chat_controller.dart';
import 'package:get/get.dart';

class SingleChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SingleChatController());
  }
}