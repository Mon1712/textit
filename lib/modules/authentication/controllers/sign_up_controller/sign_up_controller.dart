
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:chateo/data/repositories/user_assets/user_assets.dart';
import 'package:chateo/data/models/user_model/user_model.dart';
import 'package:chateo/data/repositories/local_storage/local_storage.dart';
import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/dialogs/show_date_picker/show_date_picker.dart';
import 'package:chateo/utils/loaders/loaders.dart';
import 'package:chateo/utils/network_manager/network_manager.dart';
import 'package:chateo/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {

  /// variables
  RxBool passObscureText = true.obs;
  RxBool confPassObscureText = true.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final aboutController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  Rxn<File?> image = Rxn<File?>();
  Random random = Random();

  /// toggle obscure
  void toggleObscure(RxBool obscure) {
    obscure.value = !obscure.value;
  }

  @override
  void onInit() async {
    aboutController.text = "Hey their I am using Textit";
    super.onInit();
  }

  /// select date of birth
  void selectDateOfBirth(
      {required BuildContext context, required bool dark}) async {
    String dateOfBirth = await ShowDatePicker.showDate(context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime.now().subtract(
            const Duration(days: 365 * 13)),
        dark: dark);

    if (dateOfBirth != null.toString()) {
      dateOfBirthController.text = dateOfBirth;
    }
  }

  /// move to bottom Nav
  void moveToBottomNav() {
    Get.offAllNamed(Routes.bottomNav);
  }

  /// image picker
  Future<void> pickImage({required ImageSource source}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }


  /// sign up to the app
  void signUp() async {
    try {
      // start the loader
      FullScreenLoader.openLoadingDialog(
          "Creating account please wait.......", AppAssets.lottieLoader);

      // check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // check form validation
      if (!signUpKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await UserAuthentication.instance
          .signUpByEmailPassword(
          email: emailController.text.trim(),
          password: passController.text.trim()).then((credentials) async {
        final userModel = UserModel(
            id: credentials.user?.uid,
            profileImage: image.value != null ?
            await UserAssets.instance.saveUserProfileImage(
                uid: credentials.user!.uid, image: image.value!)
                : await UserAssets.instance.uploadDefaultImage(),
            name: nameController.text.trim(),
            phoneNumber: phoneNumberController.text.trim(),
            email: emailController.text.trim(),
            dateOfBirth: dateOfBirthController.text.trim(),
            about: aboutController.text.trim(),
            isOnline: true,
            lastActive: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
            createdAt: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString()
        );
        await UserRepository.instance
            .storeUserRecord(userModel: userModel)
            .then((_) {
          FullScreenLoader.stopLoading();
          moveToBottomNav();
          Loaders.successSnackBar(title: "Account created Successfully");
        });
      });
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: "$e");
    }
  }


  /// Google sign in
  void googleSignIn() async {
    try {
      // start the loader
      FullScreenLoader.openLoadingDialog(
          "Creating account please wait.......", AppAssets.lottieLoader);

      // check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await UserAuthentication.instance
          .signInByGoogle().then((credentials) async {
        final userModel = UserModel(
            id: credentials.user?.uid,
            name: credentials.user?.displayName,
            phoneNumber: credentials.user?.phoneNumber,
            email: credentials.user?.email,
            dateOfBirth: "",
            about: "Hey their i am using Textit",
            profileImage: credentials.user?.photoURL,
            isOnline: true,
            lastActive: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
            createdAt: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString()
        );
        await UserRepository.instance
            .storeUserRecord(userModel: userModel)
            .then((_) async {
          SharedPrefHelper.instance.setBool("requiredFields", true);
          FullScreenLoader.stopLoading();
          moveToBottomNav();
          Loaders.successSnackBar(title: "Account created Successfully");
        });
      });
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: "$e");
    }
  }
}
