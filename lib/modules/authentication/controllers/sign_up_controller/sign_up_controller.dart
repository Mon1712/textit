import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  /// variables
  RxBool passObscureText = true.obs;
  RxBool confPassObscureText = true.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final statusController = TextEditingController();
  final userNameController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();

  /// toggle obscure
  void toggleObscure(RxBool obscure){
    obscure.value = !obscure.value;
  }
}
