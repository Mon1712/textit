import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  /// variables
  RxBool obscureText = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  /// toggle obscure
 void toggleObscure(){
   obscureText.value = !obscureText.value;
 }

  /// login to the app
  Future<void> login() async{
    if(!loginKey.currentState!.validate()){
     return;
    }
  }
}