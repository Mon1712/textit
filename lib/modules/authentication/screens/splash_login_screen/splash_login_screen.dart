
import 'package:chateo/modules/authentication/controllers/splash_login_controller/splash_login_controller.dart';
import 'package:chateo/modules/widgets/app_background/app_background.dart';
import 'package:chateo/modules/widgets/elevated_button/elevated_button.dart';
import 'package:chateo/modules/widgets/log_in_methods/log_in_methods.dart';
import 'package:chateo/modules/widgets/or_divider/or_divider.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/app_text/app_text.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashLoginScreen extends StatelessWidget {
  const SplashLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashLoginController>();
    return Scaffold(

      /// body
      body: AppBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  20.height,
                  Animate(
                    effects: const [
                      FadeEffect(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                      SlideEffect(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                        begin: Offset(0.0, 0.05),
                      ),
                    ],
                    child: AnimatedBuilder(
                      animation: controller.animationController,
                      builder: (context, child) {
                        return ShaderMask(
                          shaderCallback: (bounds) {
                            // Animate the gradient by changing stops dynamically
                            return LinearGradient(
                              colors: const [AppColors.blue3D4A7A,AppColors.blueF1F6FA, AppColors.redF04A4C,],
                              stops: [controller.animationController.value,controller.animationController.value + 0.2, controller.animationController.value + 0.5],

                            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                          },
                          child: Text(
                            AppText.splashLoginTitle,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                             shadows:  <Shadow>[
                               Shadow(
                                   color: Colors.black.withOpacity(0.5),
                                   blurRadius: 5.0,
                                 offset: const Offset(5, 10)
                               )
                             ],
                              fontSize: ScreenPixels.sixtyEight,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.height,
                  Text(AppText.splashLoginDesc,
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.7),
                      fontSize: 16,),),
                  40.height,
                  LogInMethods(
                    onTapApple: () {},
                    onTapFb: () {},
                    onTapGoogle: () {
                      controller.moveToBottomNav();
                    },
                    appleColor: AppColors.white,
                  ),
                  30.height,
                  OrDivider(
                    dividerColor: AppColors.white.withOpacity(0.2),
                    titleColor: AppColors.white,
                  ),
                  30.height,
                  SizedBox(
                    width: double.infinity,
                    child: CElevatedButton(
                      btnName: "Sign up with email",
                      btnColor: AppColors.white.withOpacity(0.37),
                      onPressed: () {
                        controller.moveToSignUp();
                      },
                      textColor: AppColors.white,
                    ),
                  ),
                  40.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Existing Account? ",
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.6),
                          fontSize: ScreenPixels.fourteen,),),
                      InkWell(
                        onTap: () {
                          controller.moveToLogIn();
                        },
                        child: Text(" Log in",
                          style: TextStyle(color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenPixels.fourteen,),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}





