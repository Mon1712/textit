import 'package:chateo/firebase_options.dart';
import 'package:chateo/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utils/network_manager/network_manager.dart';
import 'utils/themes/app_theme.dart';

Future<void> main() async{

  /// Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();


  /// Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_){
    Get.put(NetworkManager());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
        builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          getPages: AppPages.routes,
          initialRoute: AppPages.initialPage,
        );
      }
    );
  }
}
