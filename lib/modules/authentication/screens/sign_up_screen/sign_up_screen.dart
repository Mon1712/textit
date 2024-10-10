import 'package:chateo/modules/authentication/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:chateo/modules/widgets/cached_image/file_image_container/file_image_container.dart';
import 'package:chateo/modules/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:chateo/modules/widgets/gradient_button/gradient_button.dart';
import 'package:chateo/modules/widgets/title_and_textfield/title_and_textfield.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/app_text/app_text.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:chateo/utils/validations/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    var dark = HelperFunctions.isDarkerMode(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(

          /// App Bar
          appBar: const CAppBar(),

          /// body
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenHeight.ten),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(AppText.signUpTitle, style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,),
                  20.height,
                  Text(AppText.signUpDesc, style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium, textAlign: TextAlign.center,),

                 40.height,

                  /// Profile picture
                  Obx(
                    ()=>
                    FileImageContainer(
                        image: controller.image.value,
                      height: ScreenHeight.oneHundred,
                      width: ScreenHeight.oneHundred,
                      color: AppColors.blueA1B5D8.withOpacity(0.5),
                      positionBottom: 0,
                      positionRight: 0,
                      borderColor: AppColors.blueA1B5D8,
                      child:
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: dark ?[]:[
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: AppColors.grey797C7B.withOpacity(0.2),
                                  offset: const Offset(1, 1)

                              )
                            ]
                        ),
                        child: Material(
                          color: AppColors.transparent,
                          child: InkWell(
                            onTap: (){
                              controller.pickImage(source: ImageSource.gallery);
                            },
                            borderRadius: BorderRadius.circular(100),
                            child: Ink(
                              padding: EdgeInsets.all(ScreenHeight.six),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dark?AppColors.black151515:AppColors.white,
                              ),
                              child: SvgPicture.asset(AppAssets.icUpload,height: ScreenHeight.twenty,width:  ScreenHeight.twenty,colorFilter: ColorFilter.mode(dark?AppColors.white:AppColors.black151515, BlendMode.srcIn),),
                            ),
                          ),
                        ),
                      ),
                  ),
                  ),
                  30.height,

                  /// Text Fields
                  Form(
                    key: controller.signUpKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Name
                          TitleAndTextField(
                            title: "Your name",
                            controller: controller.nameController,
                            validator: (value) => Validator.validateName(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'\b\w+(\s{0,1})'))
                            ],
                          ),

                          30.height,

                          // phone number
                          TitleAndTextField(
                            title: "Your phone number",
                            controller: controller.phoneNumberController,
                            validator: (value) =>
                                Validator.validateUsername(value),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'^\d+$')),
                              LengthLimitingTextInputFormatter(10)
                            ],
                            hintText: "+91",
                          ),

                          30.height,

                          // email
                          TitleAndTextField(
                            title: "Your email",
                            controller: controller.emailController,
                            validator: (value) =>
                                Validator.validateEmail(value),
                          ),

                          30.height,

                          // password
                          Obx(
                                () =>
                                TitleAndTextField(
                                  title: "Password",
                                  obscureText: controller.passObscureText.value,
                                  controller: controller.passController,
                                  validator: (value) =>
                                      Validator.validatePassword(value),
                                  suffixIcon: InkWell(
                                    borderRadius: BorderRadius.circular(
                                        ScreenHeight.oneHundred),
                                    onTap: () {
                                      controller.toggleObscure(
                                          controller.passObscureText);
                                    },
                                    child: Icon(controller.passObscureText.value
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash),
                                  ),
                                ),
                          ),

                          30.height,

                          // confirm Password
                          Obx(
                                () =>
                                TitleAndTextField(
                                  title: "Confirm password",
                                  obscureText: controller.confPassObscureText
                                      .value,
                                  controller: controller.confirmPassController,
                                  validator: (value) =>
                                      Validator.validateConfirmPassword(
                                          value,
                                          controller.passController.text),
                                  suffixIcon: InkWell(
                                    borderRadius: BorderRadius.circular(
                                        ScreenHeight.oneHundred),
                                    onTap: () {
                                      controller.toggleObscure(
                                          controller.confPassObscureText);
                                    },
                                    child: Icon(
                                        controller.confPassObscureText.value
                                            ? CupertinoIcons.eye
                                            : CupertinoIcons.eye_slash),
                                  ),
                                ),
                          ),
                          30.height,

                          // Date of birth
                          TitleAndTextField(
                            title: "Date of birth",
                            controller: controller.dateOfBirthController,
                            suffixIcon: SvgPicture.asset(
                              AppAssets.icDob,
                              colorFilter: ColorFilter.mode(dark
                                  ? AppColors.white
                                  : AppColors.black000E08, BlendMode.srcIn),),
                            onTap: () async {
                              controller.selectDateOfBirth(context: context,
                                  dark: dark);
                            },
                            readOnly: true,
                          ),

                          30.height,

                          // Date of birth
                          TitleAndTextField(
                            title: "Status",
                            controller: controller.aboutController,
                            validator: (value) =>
                                Validator.validateStatus(value),
                          ),
                        ]
                    ),
                  ),


                  SizedBox(
                    height: Get.height * 0.15,
                  ),

                  /// Button
                  CGradientButton(
                    btnName: "Create an account",
                    onTap: () {
                      controller.signUp();
                    },
                  ),
                  20.height,

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
