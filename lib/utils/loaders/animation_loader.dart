
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader({super.key, required this.text, required this.animation,  this.showAction=false, this.actionText, this.onActionPress});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPress;

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return Center(
      child:  Column(
        children: [

          /// Display lottie animation
        Lottie.asset(animation,width: Get.width*0.8),
          10.height,
          Material(
              color: AppColors.transparent,
              child: Text(text, style: TextStyle(fontSize: 16, color:dark ? AppColors.white.withOpacity(0.8) : AppColors.black151515),)),
          10.height,
          showAction?
          SizedBox(
            width: Get.width*0.25,
            child: OutlinedButton(onPressed: onActionPress,
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.black000E08.withOpacity(0.4)
                )
                ,child: Text(text, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),),)
          )
              :const SizedBox()
        ],
      ),
    );
  }
}
