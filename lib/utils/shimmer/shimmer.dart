
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key, required this.height, required this.width, this.color,  this.radius = 15});
final double height;
final double width;
final Color? color;
final double radius;
  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkerMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[350]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color?? ( dark ? AppColors.black000E08 : AppColors.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),);
  }
}
