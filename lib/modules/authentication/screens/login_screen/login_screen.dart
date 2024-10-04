import 'package:chateo/modules/authentication/controllers/login_controller/login_controller.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/gradient_button/gradient_button.dart';
import 'package:chateo/modules/widgets/log_in_methods/log_in_methods.dart';
import 'package:chateo/modules/widgets/or_divider/or_divider.dart';
import 'package:chateo/modules/widgets/title_and_textfield/title_and_textfield.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/app_text/app_text.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    var dark = HelperFunctions.isDarkerMode(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(

        /// App Bar
        appBar: const CAppBar(),

        /// body
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: ScreenHeight.ten),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(AppText.loginTitle, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,),
                20.height,
                Text(AppText.loginDesc, style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium, textAlign: TextAlign.center,),
                40.height,
                LogInMethods(
                  appleColor: dark ? AppColors.white : AppColors.black000E08,
                  onTapGoogle: () {},
                  onTapFb: () {},
                  onTapApple: () {},
                ),
                30.height,
                const OrDivider(
                  dividerColor: AppColors.greyCDD1D0,
                  titleColor: AppColors.grey797C7B,
                ),
                30.height,

                /// Text Fields
                Form(
                  key: controller.loginKey,
                  child: Column(
                      children: [

                        // email
                        TitleAndTextField(
                          title: "Your email",
                          controller: controller.emailController,
                        ),

                        30.height,

                        // password
                        Obx(
                              () =>
                              TitleAndTextField(
                                title: "Password",
                                obscureText: controller.obscureText.value,
                                controller: controller.passController,
                                suffixIcon: InkWell(
                                  borderRadius: BorderRadius.circular(ScreenHeight.oneHundred),
                                  onTap: () {
                                    controller.toggleObscure();
                                  },
                                  child: Icon(controller.obscureText.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash),
                                ),
                              ),
                        ),
                      ]
                  ),
                ),

                SizedBox(
                  height: Get.height * 0.15,
                ),

                /// Button
                CGradientButton(
                  btnName: "Log in",
                  onTap: () {},
                ),
                20.height,

                /// Forget Password
                InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: ScreenHeight.ten, vertical:ScreenHeight.four),
                      child: Text("Forgot Password?", style: TextStyle(
                          color: dark ? AppColors.blueA1B5D8 : AppColors
                              .blue3D4A7A,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenPixels.fourteen),),
                    )),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}





