import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CGradientButton extends StatelessWidget {
  const CGradientButton({
    super.key, required this.btnName, this.onTap,
  });

  final String btnName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.black000E08.withOpacity(0.2),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              AppColors.black000E08,
              AppColors.blue3D4A7A,
              AppColors.royalBlue
            ],
              stops: [0.1, 0.6,1], // Stops must be in ascending order
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.white)
        ),
        child:  Center(child: Text(btnName,style: const TextStyle(color:AppColors.white, fontWeight: FontWeight.w700, fontSize: 16),)),
      ),
    );
  }
}