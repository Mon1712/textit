import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      const  SizedBox(
            height: double.infinity,
            width: double.infinity,
            child:  Image(image: AssetImage(AppAssets.splashWithShadeBgImage), fit: BoxFit.cover,)),
        child
      ],
    );
  }
}