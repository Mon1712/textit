import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key, required this.svgIcon, this.containerColor, this.onTap, this.colorFilter, this.paddingAll,
  });

  final String svgIcon;
  final Color? containerColor;
  final void Function()? onTap;
  final ColorFilter? colorFilter;
  final double? paddingAll;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(ScreenHeight.oneHundred),
      child: Container(
          padding:  EdgeInsets.all(paddingAll??ScreenHeight.six),
          decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: containerColor
          ),
          child: SvgPicture.asset(svgIcon,colorFilter:colorFilter,)),
    );
  }
}