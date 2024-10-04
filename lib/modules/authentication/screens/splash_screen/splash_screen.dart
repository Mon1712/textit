import 'package:chateo/modules/authentication/controllers/splash_controller/splash_controller.dart';
import 'package:chateo/modules/widgets/app_background/app_background.dart';
import 'package:flutter/material.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:get/get.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<SplashController>();
    return  Scaffold(
      body: AppBackground(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                  top: Get.height*0.11,
                  left: Get.width*0.225,
                  child: const Image(image: AssetImage(AppAssets.textitImg))),
            const Image(image: AssetImage(AppAssets.splashTextitImage))

          ],),
        ),
      ),
    );
  }
}

