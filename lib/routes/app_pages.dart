import 'package:chateo/bindings/bottom_navigation_bindings/bottom_navigation_bindings.dart';
import 'package:chateo/bindings/login_bindings/login_bindings.dart';
import 'package:chateo/bindings/sign_up_bindings/sign_up_bindings.dart';
import 'package:chateo/bindings/single_chat_bindings/single_chat_bindings.dart';
import 'package:chateo/bindings/splash_bindings/splash_bindings.dart';
import 'package:chateo/bindings/splash_login_bindings/splash_login_bindings.dart';
import 'package:chateo/bindings/user_info_bindings/user_info_bindings.dart';
import 'package:chateo/modules/authentication/screens/login_screen/login_screen.dart';
import 'package:chateo/modules/authentication/screens/sign_up_screen/sign_up_screen.dart';
import 'package:chateo/modules/authentication/screens/splash_login_screen/splash_login_screen.dart';
import 'package:chateo/modules/authentication/screens/splash_screen/splash_screen.dart';
import 'package:chateo/modules/features/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:chateo/modules/features/screens/single_chat_screen/single_chat_screen.dart';
import 'package:chateo/modules/features/screens/user_info_screen/user_info_screen.dart';
import 'package:chateo/utils/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const initialPage = Routes.splash;

  static List<GetPage<dynamic>> routes = [
    getPage(
        name: _Paths.splash,
        page: const SplashScreen(),
        binding: SplashBindings()),
    getPage(
        name: _Paths.splashLogin,
        page: const SplashLoginScreen(),
        binding: SplashLoginBindings()),
    getPage(
        name: _Paths.logIn,
        page: const LoginScreen(),
        binding: LoginBindings()),
    getPage(
        name: _Paths.signUp,
        page: const SignUpScreen(),
        binding: SignUpBindings()),
    getPage(
        name: _Paths.bottomNav,
        page: const BottomNavigationScreen(),
        binding: BottomNavigationBindings(),
    customTransition: MyCustomTransition()),
    getPage(
        name: _Paths.singleChat,
        page: const SingleChatScreen(),
        binding: SingleChatBindings(),
        transition: Transition.fade),
    getPage(
        name: _Paths.userInfo,
        page: const UserInfoScreen(),
        binding: UserInfoBindings(),
        transition: Transition.fade),

  ];
}

GetPage<dynamic> getPage(
    {required String name,
      required Widget page,
      Bindings? binding,
      List<Bindings>? bindings,
      CustomTransition? customTransition,
      Transition? transition}) {
  return GetPage(
    name: name,
    page: () => page,
    transition: transition ?? Transition.cupertinoDialog,
    binding: binding,
    bindings: bindings ?? [],
    customTransition: customTransition
  );
}