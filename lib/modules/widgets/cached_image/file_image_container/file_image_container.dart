import 'dart:io';

import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:flutter/material.dart';

class FileImageContainer extends StatelessWidget {
  final double ?height;
  final double ?width;
  final double ?radius;
  final double ?imageRadius;
  final double ?paddingValue;
  final Widget ?child;
  final Color ? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final File? image;
  final BoxFit? fit;
  final Color ? borderColor;
  final Function()? onTap;
  final void Function(TapDownDetails)? onTapDown;
  final double? positionLeft;
  final double? positionTop;
  final double? positionRight;
  final double? positionBottom;
  final double? positionWidth;
  final double? positionHeight;
  const FileImageContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.imageRadius,
    this.color,
    this.paddingValue,
    this.radius,
    this.margin,
    this.borderColor,
    this.fit,
    this.image,
    this.padding, this.onTap,
    this.onTapDown,
    this.positionLeft,
    this.positionTop,
    this.positionRight,
    this.positionBottom,
    this.positionWidth,
    this.positionHeight
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            margin: margin,
            padding: padding ?? EdgeInsets.all(paddingValue ?? 0),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                    radius ?? ScreenHeight.fourHundred),
                border: Border.all(color: borderColor ?? Colors.transparent,width: 2),
              image: DecorationImage(image: image !=null? FileImage(image!):const AssetImage(AppAssets.icPerson, ),fit: fit??BoxFit.cover),
            ),
          ),
          Positioned(
              height: positionHeight,
              width: positionWidth,
              left: positionLeft,
              right: positionRight,
              top: positionTop,
              bottom: positionBottom,
              child: child ?? const SizedBox.shrink())
        ],
      ),
    );
  }
}